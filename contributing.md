# How to Contribute

We use the [Gitflow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow) workflow to make our lives easier. This means all new lessons, practices, and edits should be made in separate branches -- not the `master` branch.

If you have questions or run into problems at any point, contact [Kelly](mailto:sovacool@umich.edu).

## Setup

### Git

If you haven't already:

1. Configure git on your local machine

    Use the same email that is associated with your GitHub account.
    ```
    git config --global user.name "Firstname Lastname"
    git config --global user.email "you@email.com"
    ```

1. Clone this repo
    ```
    git clone https://github.com/GWC-DCMB/ClubCurriculum
    ```

If you need a refresher, Software Carpentry has a lesson on [Version Control with Git](http://swcarpentry.github.io/git-novice/).

### Dependencies

We teach with [Google Colab](https://colab.research.google.com), which has all of our dependencies already installed. 
However, we recommend editing the notebooks by running [JupyterLab](https://jupyterlab.readthedocs.io/en/stable/) on your local machine. 
The minimum required dependencies are listed in the [environment file](environment.yml). 
You're welcome to use your package manager of choice (Kelly's recommendation: [conda](https://docs.conda.io/en/latest/miniconda.html)).

## Creating or editing

1. Move to the ClubCurriculum directory on your computer

    ```
    cd ClubCurriculum
    ```

1. Create a new branch for your feature
    
    Give it a short, descriptive name.
    ```
    git checkout -b new-branch-name
    ```

1. Make your edits
    ```
    jupyter lab notebook-name.ipynb
    ```
    Be sure to save them from jupyter!
    If you're creating a new lesson or practice, it's easiest to edit the lesson key, 
    then copy the key to the lesson folder and remove any blanks that you want to be filled in during the live coding demo.

1. Commit & push your changes
    ```
    git add notebook-name.ipynb
    git commit -m "Edit lesson XX"
    ```
    (Take a look at this [style guide](https://chris.beams.io/posts/git-commit/) for writing good commit messages.)
    
    If you're pushing your branch for the first time, you'll have to set the upstream:
    ```
    git push --set-upstream origin new-branch-name
    ```

    Otherwise, just push like usual:
    ```
    git push origin new-branch-name
    ```

    If you forget the branch name, you can list existing branches using the command:
    ```
    git branch --list
    ```

1. Open a pull request
    1. Open the [repo page in your web browser](https://github.com/GWC-DCMB/ClubCurriculum)
    1. If you want to see what the modifications look like before opening a pull request, you can go to the document you modified and change the branch to the left of the file name. 
    1. Go to the pull requests tab and click `new pull request`.
    1. Select your branch name to compare to master.
    1. Create the pull request.
    1. Assign a reviewer.
    The reviewer will then take a look at the changes, make any edits as needed, and merge the branch into master

## Reviewing

1. Make sure your local copy of the repo is up-to-date
    ```
    git pull
    ```
1. Checkout the branch corresponding to the pull request you're reviewing
    ```
    git checkout branch-name
    ```
1. Review and edit the contents
    ```
    jupyter lab notebook-name.ipynb
    ```
1. Commit & push changes if needed
    ```
    git add notebook-name.ipynb
    git commit -m "Revise lesson XX"
    git push
    ```

1. Merge the pull request when you're happy with it

    Either press the `merge` button on Github in your web browser,
    or do it from the command line:
    ```
    git checkout master
    git merge branch-name master
    ```
    In the merge commit message, reference any [issues](https://github.com/GWC-DCMB/ClubCurriculum/issues) (our To-Do list) that the pull request resolves so the issue is closed automatically. 
    For example, the [commit](https://github.com/GWC-DCMB/ClubCurriculum/commit/e871017fc77fe2023f2488d3c18ae4baaee5b03f) message I wrote when adding this file was `Add contributing instructions (Resolves #11)`.
    
    If no more work will be done on that branch, you can delete it on Github to reduce clutter.

## Misc. Notes

- If you need to read in a dataset, Pandas can read https links to raw github files. Example:
    ```
    path = 'https://raw.githubusercontent.com/GWC-DCMB/ClubCurriculum/master/'
    tips = pd.read_csv(path + 'SampleData/tips.csv')
    ```
    Don't use local filepaths (e.g. `pd.read_csv('../SampleData/tips.csv')`), because we live-code in Google Colab.
- If you come across legacy references to mounting Google Drive, please remove them. We previously used this feature, but have decided to use https links to raw github files instead (see above bullet).
- Every Key (filename starts with `KEY_`) should show the output of all cells, while the output cells of every regular Lesson and Practice should be empty. Make sure Keys work by running all cells in Jupyter Lab by clicking `Run` > `Run All Cells`. To remove the output cells from a notebook, click `Edit` > `Clear All Outputs`.
