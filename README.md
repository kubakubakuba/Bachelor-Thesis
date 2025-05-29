# Project repository
The project linked to this thesis can be found on [GitHub](https://github.com/kubakubakuba/mrs-uvdar-distance-estimator)

# Compilation
First, compile all the plots written in `pgf` by running:

```bash
cd fig/pgfplot/
make
```

Then you can build the thesis by running
```bash
make
```
in the root directory.

To build the thesis defense slides, run:
```bash
cd slides
make
```

in Overleaf, this can be configured by changing the `Main document` option in the left side panel (to either `main.tex` or `slides/slides.tex`), and then forcing a `Recompile from scratch` option.