# Signals and Systems MATLAB Lab

A compact MATLAB laboratory for revisiting core Signals and Systems concepts through implementation, visualization, and transform-domain analysis.

The repository follows the progression of a typical Signals and Systems course: basic continuous- and discrete-time signals, signal transformations, convolution, Fourier representations, Laplace analysis, and the Z-transform. The scripts are intentionally small and focused. Each one isolates a specific concept so that the mathematical result can be checked directly in MATLAB rather than hidden inside a larger application.

The aim is not to replace the theory with code, but to use MATLAB as an engineering tool for testing and reinforcing it.

## Repository Overview

```text
SaSLab/
├── basicSignals/
│   ├── continuous_time/
│   └── discrete_time/
├── signalManipulations/
│   ├── continuous-time/
│   └── discrete-time/
├── Convolution/
│   ├── continuous_time/
│   └── discrete_time/
├── Fourier/
│   ├── CTFS/
│   ├── CTFT/
│   ├── DTFS/
│   ├── DTFT/
│   └── DFT-FFT/
├── Laplace/
└── zTransform/
```

## Basic Signals

The first part of the repository implements the standard signals used throughout the rest of the experiments in both continuous and discrete time.

The continuous-time examples include sinusoidal and exponential signals, the unit step, the unit ramp, and a numerical approximation of the Dirac delta. Since an ideal impulse cannot be represented directly as an ordinary sampled signal, the CT impulse example uses a narrow rectangular pulse whose area is kept equal to one.

The discrete-time section contains the corresponding sinusoidal and exponential sequences, unit step, unit ramp, and unit impulse. `plot` is used for continuous-time representations, while `stem` is used to preserve the sample-based interpretation of discrete-time signals.

## Signal Manipulations

The signal manipulation scripts examine four basic operations:

- time shifting
- time scaling
- time reversal
- amplitude scaling

The operations are implemented separately for CT and DT signals so that the distinction between transformations of \(x(t)\) and \(x[n]\) remains explicit.

The CT time-shifting experiment also connects a phase displacement of a sinusoid to an equivalent time delay,

\[
t_0=\frac{\phi}{2\pi f}.
\]

These scripts are mainly intended to make transformations such as \(x(t-t_0)\), \(x(at)\), \(x(-t)\), and \(Ax(t)\) visually immediate.

## Convolution

Both continuous- and discrete-time convolution are implemented with MATLAB's `conv()` function.

For a discrete-time sequence, `conv()` directly evaluates the convolution sum,

\[
y[n]=\sum_k x[k]h[n-k].
\]

For the continuous-time experiment, the signals

\[
x(t)=e^{-t}u(t), \qquad h(t)=e^{-2t}u(t)
\]

are represented on a finite time grid. MATLAB still performs a convolution of numerical arrays, so the output is multiplied by the sampling interval \(\Delta t\):

\[
y(t)\approx \Delta t\,\mathrm{conv}(x,h).
\]

This provides a numerical approximation to the continuous convolution integral and also illustrates why the convolution output requires its own time axis.

## Fourier Analysis

The Fourier section is divided according to the signal representation being studied rather than treating every Fourier operation as the same numerical procedure.

### Continuous-Time Fourier Series (CTFS)

A periodic square wave is reconstructed from its odd harmonics,

\[
x(t)=\frac{4}{\pi}
\left[
\sin(\omega_0t)
+\frac{1}{3}\sin(3\omega_0t)
+\frac{1}{5}\sin(5\omega_0t)+\cdots
\right].
\]

The reconstruction is repeated with increasing harmonic content. This makes the convergence toward the square wave visible and gives a direct view of the Gibbs phenomenon near discontinuities.

### Discrete-Time Fourier Series (DTFS)

A finite periodic sequence is represented through its DTFS coefficients,

\[
C_k=\frac{1}{N}\sum_{n=0}^{N-1}
x[n]e^{-j2\pi kn/N}.
\]

The coefficients are calculated explicitly and their magnitude and phase are displayed. This experiment emphasizes that an \(N\)-periodic discrete-time sequence has \(N\) distinct Fourier-series coefficients.

### Continuous-Time Fourier Transform (CTFT)

The CTFT experiments use symbolic MATLAB tools to study analytical transform pairs and properties.

The examples include:

- the CTFT of a rectangular pulse,
- the transform of a decaying exponential,
- magnitude and phase representations,
- the time-shifting property.

For the time-shifting experiment,

\[
x(t-t_0)
\longleftrightarrow
e^{-j\omega t_0}X(\omega),
\]

the original and shifted signals are compared in the frequency domain. The magnitude remains unchanged while the phase carries the effect of the delay.

The rectangular-pulse script also retains an alternative numerical construction of the pulse as a commented reference, making the distinction between constructing a sampled waveform and evaluating an analytical CTFT explicit.

### Discrete-Time Fourier Transform (DTFT)

Finite sequences are evaluated in frequency using `freqz()`. Although `freqz()` is primarily a digital-filter frequency-response tool, evaluating a finite coefficient sequence in this form is equivalent to evaluating its DTFT on the unit circle.

The DTFT experiments cover:

- magnitude and phase,
- \(2\pi\)-periodicity,
- time shifting.

The periodicity experiment explicitly repeats the evaluated spectrum to illustrate

\[
X(e^{j(\omega+2\pi)})=X(e^{j\omega}).
\]

The time-shifting experiment shows the DT counterpart of the CTFT property: delaying a sequence changes its phase response without changing its magnitude spectrum.

### DFT and FFT

The final Fourier experiment moves from analytical transform representations to practical spectral analysis of sampled data.

A signal containing 50 Hz and 120 Hz sinusoidal components is generated and transformed using MATLAB's `fft()` implementation. The FFT computes the DFT efficiently; the resulting two-sided spectrum is normalized and converted into a single-sided amplitude spectrum.

The experiment demonstrates how frequency components that are not immediately obvious in the time waveform become directly identifiable in the frequency domain.

## Laplace Transform

The Laplace section focuses on symbolic transform operations and continuous-time system representation.

`laplace()` and `ilaplace()` are used on standard signals such as

\[
e^{-2t}, \qquad t, \qquad \sin(3t),
\]

so that forward and inverse transform pairs can be checked directly.

The section then introduces a continuous-time transfer function,

\[
H(s)=\frac{1}{s^2+2s+5},
\]

using MATLAB's `tf` representation. Its poles and zeros are obtained programmatically and displayed in the \(s\)-plane with `pzmap()`.

This is the point where the transform is connected to LTI system analysis: pole locations are no longer only algebraic roots, but quantities that describe system dynamics and stability.

## Z-Transform

The Z-transform section develops the corresponding transform-domain tools for discrete-time signals and systems.

The sequence

\[
x[n]=(0.5)^n
\]

is transformed using `ztrans()` and recovered using `iztrans()`. This provides a direct parallel with the forward and inverse Laplace examples.

A discrete-time transfer function is then created and its poles and zeros are examined in the \(z\)-plane. In particular, the example places a pole at \(z=0.5\), providing a simple connection between pole location, the unit circle, and discrete-time stability.

## MATLAB Tools Used

The scripts use a combination of core MATLAB functionality and functions from MATLAB toolboxes, including:

- `plot`, `stem`, `subplot`
- `conv`
- `fft`
- `freqz`
- `fourier`
- `laplace`, `ilaplace`
- `ztrans`, `iztrans`
- `tf`, `pole`, `zero`, `pzmap`

The repository deliberately uses symbolic tools when the objective is an analytical transform and numerical tools when the objective is sampled-signal analysis.

## Requirements

- MATLAB
- Symbolic Math Toolbox
- Signal Processing Toolbox
- Control System Toolbox

## Scope

This repository is a focused Signals and Systems study lab rather than a general-purpose signal-processing library. The implementations are kept readable enough to trace back to the underlying equations, while still making use of standard MATLAB functions where they are appropriate.

Future extensions can build naturally on this foundation with filtering, sampling and aliasing experiments, frequency-response analysis, and control-oriented system models.
