# Multiplex (VHDL)

This project implements a **4-bit multiplexer** in VHDL.  
The design selects between two 4-bit input buses (`x` and `y`) using a single select signal (`s`).  

## Entity

```vhdl
entity multiplex is
    port(
        x : in  std_logic_vector(4 downto 1);  -- 4-bit input A
        y : in  std_logic_vector(8 downto 5);  -- 4-bit input B
        s : in  std_logic;                     -- select line
        m : out std_logic_vector(3 downto 0)   -- 4-bit output
    );
end multiplex;
````

* `s = '0'` → output `m` comes from `x(1..4)`
* `s = '1'` → output `m` comes from `y(5..8)`

## Architecture

Each output bit is chosen via simple logic:

```vhdl
m(i) <= (s and y(i+4)) or ((not s) and x(i));
```

## File List

* `multiplex.vhd` → VHDL source

## Usage

1. Open Quartus, create a new project.
2. Add `multiplex.vhd` to your project.
3. Compile and simulate (e.g., with ModelSim).
4. Write a testbench to verify behavior.

## Example

For inputs:

* `x = "1010"`
* `y = "1100"`
* `s = '0'` → `m = "1010"`
* `s = '1'` → `m = "1100"`
