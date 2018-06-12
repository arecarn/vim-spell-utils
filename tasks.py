"""
Project Tasks that can be invoked using using the program "invoke" or "in"
"""

import os
from invoke import task


@task
def setup(ctx):
    """
    Install python requirements
    """
    ctx.run('pip install --requirement requirements.txt')
    try:
        os.mkdir('build')
    except FileExistsError:
        pass
    ctx.run('git clone https://github.com/junegunn/vader.vim.git build/vader.vim || true')


@task
def clean(ctx):
    """
    Clean repository using git
    """
    ctx.run('git clean -x -d')


@task
def lint(ctx):
    """
    Run Vint vim linter
    """
    files = [
        os.path.join('plugin', '*.vim'),
        os.path.join('autoload', '*.vim'),
        os.path.join('tests', 'vimrc_test'),
    ]
    files_string = " ".join(files)

    cmd = 'vint {files}'
    ctx.run(cmd.format(files=files_string))


@task
def test(ctx):
    """
    Run Tests
    """
    files_string = os.path.join('tests', '*.vader')

    cmd = "vim -Nu tests/vimrc_test -c 'Vader! {files}'"
    ctx.run(cmd.format(files=files_string), pty=True)


@task(lint, test, default=True)
def lint(ctx):
    """
    default task
    """
    pass
