## Synopsis

`pclean` is a command to keep only alphanumeric characters from a string given as input.
It's useful to convert page title into directory name.

```bash
pclean "Topic modeling with Gensim and Latent Dirichlet Allocation (LDA)"
# topic_modeling_with_gensim_and_latent_dirichlet_allocation__lda_
```

## The latest version

You can find the latest version to ...

```bash
git clone ...
```

## Usage

You can run the application with the following command

```python
python -m pclean "Topic Modeling with Gensim and Latent Dirichlet Allocation (LDA)"
```

## Contributing

### Install development environment

Use make to instanciate a python virtual environment in ./venv3 and install the
python dependencies.

```bash
make venv3
make install_requirements_dev
```

### Initiate or update the library requirements

If you want to initiate or update all the package and freeze a new requirements.txt, use
this procedure

```bash
make update_requirements
```

### Activate the python environment

When you setup the requirements, a `venv3` directory on python 3 is created.
To activate the venv, you have to execute /

```bash
source venv3/bin/activate
```

### Run the linter and the unit tests

Before commit or send a pull request, you have to execute pylint to check the syntax
of your code and run the unit tests to validate the behavior.

```bash
make lint
make tests
```

## Contributors

* Fabien Arcellier

## License

A short snippet describing the license (MIT, Apache, etc.)
