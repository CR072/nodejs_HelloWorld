#!/bin/bash
echo "Updating package lists..."
sudo apt update -y

echo "Installing packages..."
sudo apt install -y \
    build-essential \
    curl \
    git \
    wget \
    ca-certificates \
    apt-transport-https \
    gcc \
    g++ \
    elixir \
    gfortran \
    golang-go \
    default-jdk \
    nodejs \
    npm \
    lua5.4 \
    perl \
    python3 \
    python3-pip \
    scala \
    sbt

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.cargo/env"

echo "Install Zig, Kotlin and C# dependencies yourself."

echo "Compiling C..."
if gcc C.c -o C_run -lm; then
    echo "C compilation complete. Executable: C_run"
else
    echo "Error while compiling C, skipping..."
fi

echo "Compiling C#..."
if command -v dotnet &> /dev/null; then
    mkdir -p TempCSharpProject
    cp C#.cs TempCSharpProject/Program.cs
    cd TempCSharpProject
    if dotnet new console --force --name TempCSharpProject --output . > /dev/null 2>&1; then
        DOTNET_RID=""
        ARCH=$(dpkg --print-architecture)
        case "$ARCH" in
            amd64) DOTNET_RID="linux-x64" ;;
            arm64) DOTNET_RID="linux-arm64" ;;
            armhf) DOTNET_RID="linux-arm" ;;
            *) echo "Warning: Unsupported architecture for .NET RID: $ARCH. C# compilation might use a generic RID or fail." ;;
        esac

        PUBLISH_CMD="dotnet publish -c Release /p:AssemblyName=CSharp_run -o ./publish_temp > /dev/null"
        if [ -n "$DOTNET_RID" ]; then
            PUBLISH_CMD="dotnet publish -c Release -r \"$DOTNET_RID\" --self-contained true /p:AssemblyName=CSharp_run -o ./publish_temp > /dev/null"
        fi

        if eval "$PUBLISH_CMD"; then
            if [ -f "./publish_temp/CSharp_run" ]; then
                mv ./publish_temp/CSharp_run ../CSharp_run
                echo "C# compilation successful. Executable: ../CSharp_run"
            else
                echo "Error while compiling C#, skipping..."
            fi
        else
            echo "Error while compiling C#, skipping..."
        fi
    else
        echo "Error while compiling C#, skipping..."
    fi
    cd ..
    rm -rf TempCSharpProject
else
    echo "Error while compiling C#, skipping..."
fi

echo "Compiling C++..."
if g++ C++.cpp -o Cpp_run -std=c++17; then
    echo "C++ compilation complete. Executable: Cpp_run"
else
    echo "Error while compiling C++, skipping..."
fi

echo "Compiling Elixir..."
if command -v elixirc &> /dev/null; then
    if elixirc Elixir.exs; then
        echo "Elixir compilation complete. (Produces .beam file, e.g., Elixir.HelloWorld.beam)"
    else
        echo "Error while compiling Elixir, skipping..."
    fi
else
    echo "Error while compiling Elixir, skipping..."
fi

echo "Compiling Fortran..."
if command -v gfortran &> /dev/null; then
    if gfortran fortran.f90 -o Fortran_run; then
        echo "Fortran compilation complete. Executable: Fortran_run"
    else
        echo "Error while compiling Fortran, skipping..."
    fi
else
    echo "Error while compiling Fortran, skipping..."
fi

echo "Compiling Go..."
if command -v go &> /dev/null; then
    if go build -o Go_run GoLang.go; then
        echo "Go compilation complete. Executable: Go_run"
    else
        echo "Error while compiling Go, skipping..."
    fi
else
    echo "Error while compiling Go, skipping..."
fi

echo "Compiling Java..."
if command -v javac &> /dev/null; then
    if javac Java.java; then
        echo "Java compilation complete. Class file: Java.class (Run with: java Java)"
    else
        echo "Error while compiling Java, skipping..."
    fi
else
    echo "Error while compiling Java, skipping..."
fi

echo "Compiling Kotlin..."
if command -v kotlinc &> /dev/null; then
    if kotlinc Kotlin.kt -include-runtime -d Kotlin_run.jar; then
        echo "Kotlin compilation complete. Executable JAR: Kotlin_run.jar (Run with: java -jar Kotlin_run.jar)"
    else
        echo "Error while compiling Kotlin, skipping..."
    fi
else
    echo "Error while compiling Kotlin, skipping..."
fi

echo "Compiling Rust..."
if command -v cargo &> /dev/null; then
    if [ -d "Rust" ]; then
        cd Rust
        if cargo build --release; then
            [ -f target/release/simple ] && cp target/release/simple ../Rust_simple_run
            [ -f target/release/faster ] && cp target/release/faster ../Rust_faster_run
            echo "Rust compilation complete. Executables (if present): Rust_simple_run, Rust_faster_run"
        else
            echo "Error while compiling Rust, skipping..."
        fi
        cd ..
    else
        echo "Error while compiling Rust, skipping..."
    fi
else
    echo "Error while compiling Rust, skipping..."
fi

echo "Compiling Scala..."
if command -v scalac &> /dev/null; then
    if scalac Scala.scala; then
        echo "Scala compilation complete. (Produces .class files, main class typically based on object name, e.g., HelloWorld)"
    else
        echo "Error while compiling Scala, skipping..."
    fi
else
    echo "Error while compiling Scala, skipping..."
fi

echo "Compiling Zig..."
if command -v zig &> /dev/null; then
    if zig build-exe Zig.zig --name Zig_run -O ReleaseSafe; then
        echo "Zig compilation complete. Executable: Zig_run"
    else
        echo "Error while compiling Zig, skipping..."
    fi
else
    echo "Error while compiling Zig, skipping..."
fi

echo "--------------------------------------"
echo "Setup script finished."