
## jupyter hub

```
$ pip install matplotlib
Defaulting to user installation because normal site-packages is not writeable
Collecting matplotlib
  Downloading matplotlib-3.10.7-cp312-cp312-manylinux2014_x86_64.manylinux_2_17_x86_64.whl.metadata (11 kB)
Collecting contourpy>=1.0.1 (from matplotlib)
  Downloading contourpy-1.3.3-cp312-cp312-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl.metadata (5.5 kB)
Collecting cycler>=0.10 (from matplotlib)
  Downloading cycler-0.12.1-py3-none-any.whl.metadata (3.8 kB)
Collecting fonttools>=4.22.0 (from matplotlib)
  Downloading fonttools-4.60.1-cp312-cp312-manylinux1_x86_64.manylinux2014_x86_64.manylinux_2_17_x86_64.manylinux_2_5_x86_64.whl.metadata (112 kB)
Collecting kiwisolver>=1.3.1 (from matplotlib)
  Downloading kiwisolver-1.4.9-cp312-cp312-manylinux2014_x86_64.manylinux_2_17_x86_64.whl.metadata (6.3 kB)
Collecting numpy>=1.23 (from matplotlib)
  Downloading numpy-2.3.4-cp312-cp312-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl.metadata (62 kB)
Requirement already satisfied: packaging>=20.0 in /usr/local/lib/python3.12/site-packages (from matplotlib) (25.0)
Collecting pillow>=8 (from matplotlib)
  Downloading pillow-12.0.0-cp312-cp312-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl.metadata (8.8 kB)
Collecting pyparsing>=3 (from matplotlib)
  Downloading pyparsing-3.2.5-py3-none-any.whl.metadata (5.0 kB)
Requirement already satisfied: python-dateutil>=2.7 in /usr/local/lib/python3.12/site-packages (from matplotlib) (2.9.0.post0)
Requirement already satisfied: six>=1.5 in /usr/local/lib/python3.12/site-packages (from python-dateutil>=2.7->matplotlib) (1.17.0)
Downloading matplotlib-3.10.7-cp312-cp312-manylinux2014_x86_64.manylinux_2_17_x86_64.whl (8.7 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 8.7/8.7 MB 27.8 MB/s eta 0:00:00
Downloading contourpy-1.3.3-cp312-cp312-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl (362 kB)
Downloading cycler-0.12.1-py3-none-any.whl (8.3 kB)
Downloading fonttools-4.60.1-cp312-cp312-manylinux1_x86_64.manylinux2014_x86_64.manylinux_2_17_x86_64.manylinux_2_5_x86_64.whl (4.9 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 4.9/4.9 MB 25.7 MB/s eta 0:00:00
Downloading kiwisolver-1.4.9-cp312-cp312-manylinux2014_x86_64.manylinux_2_17_x86_64.whl (1.5 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 1.5/1.5 MB 15.0 MB/s eta 0:00:00
Downloading numpy-2.3.4-cp312-cp312-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl (16.6 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 16.6/16.6 MB 23.8 MB/s eta 0:00:00
Downloading pillow-12.0.0-cp312-cp312-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl (7.0 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 7.0/7.0 MB 23.4 MB/s eta 0:00:00
Downloading pyparsing-3.2.5-py3-none-any.whl (113 kB)
Installing collected packages: pyparsing, pillow, numpy, kiwisolver, fonttools, cycler, contourpy, matplotlib
  WARNING: The scripts f2py and numpy-config are installed in '/home/jovyan/.local/bin' which is not on PATH.
  Consider adding this directory to PATH or, if you prefer to suppress this warning, use --no-warn-script-location.
  WARNING: The scripts fonttools, pyftmerge, pyftsubset and ttx are installed in '/home/jovyan/.local/bin' which is not on PATH.
  Consider adding this directory to PATH or, if you prefer to suppress this warning, use --no-warn-script-location.
Successfully installed contourpy-1.3.3 cycler-0.12.1 fonttools-4.60.1 kiwisolver-1.4.9 matplotlib-3.10.7 numpy-2.3.4 pillow-12.0.0 pyparsing-3.2.5

[notice] A new release of pip is available: 25.0.1 -> 25.2
[notice] To update, run: pip install --upgrade pip


$ pip install scipy
Defaulting to user installation because normal site-packages is not writeable
Collecting scipy
  Downloading scipy-1.16.2-cp312-cp312-manylinux2014_x86_64.manylinux_2_17_x86_64.whl.metadata (62 kB)
Requirement already satisfied: numpy<2.6,>=1.25.2 in ./.local/lib/python3.12/site-packages (from scipy) (2.3.4)
Downloading scipy-1.16.2-cp312-cp312-manylinux2014_x86_64.manylinux_2_17_x86_64.whl (35.7 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 35.7/35.7 MB 23.8 MB/s eta 0:00:00
Installing collected packages: scipy
Successfully installed scipy-1.16.2

[notice] A new release of pip is available: 25.0.1 -> 25.2
[notice] To update, run: pip install --upgrade pip
$ 


$ pip install ipywidgets
Defaulting to user installation because normal site-packages is not writeable
Collecting ipywidgets
  Downloading ipywidgets-8.1.7-py3-none-any.whl.metadata (2.4 kB)
Requirement already satisfied: comm>=0.1.3 in /usr/local/lib/python3.12/site-packages (from ipywidgets) (0.2.3)
Requirement already satisfied: ipython>=6.1.0 in /usr/local/lib/python3.12/site-packages (from ipywidgets) (9.6.0)
Requirement already satisfied: traitlets>=4.3.1 in /usr/local/lib/python3.12/site-packages (from ipywidgets) (5.14.3)
Collecting widgetsnbextension~=4.0.14 (from ipywidgets)
  Downloading widgetsnbextension-4.0.14-py3-none-any.whl.metadata (1.6 kB)
Collecting jupyterlab_widgets~=3.0.15 (from ipywidgets)
  Downloading jupyterlab_widgets-3.0.15-py3-none-any.whl.metadata (20 kB)
Requirement already satisfied: decorator in /usr/local/lib/python3.12/site-packages (from ipython>=6.1.0->ipywidgets) (5.2.1)
Requirement already satisfied: ipython-pygments-lexers in /usr/local/lib/python3.12/site-packages (from ipython>=6.1.0->ipywidgets) (1.1.1)
Requirement already satisfied: jedi>=0.16 in /usr/local/lib/python3.12/site-packages (from ipython>=6.1.0->ipywidgets) (0.19.2)
Requirement already satisfied: matplotlib-inline in /usr/local/lib/python3.12/site-packages (from ipython>=6.1.0->ipywidgets) (0.1.7)
Requirement already satisfied: pexpect>4.3 in /usr/local/lib/python3.12/site-packages (from ipython>=6.1.0->ipywidgets) (4.9.0)
Requirement already satisfied: prompt_toolkit<3.1.0,>=3.0.41 in /usr/local/lib/python3.12/site-packages (from ipython>=6.1.0->ipywidgets) (3.0.52)
Requirement already satisfied: pygments>=2.4.0 in /usr/local/lib/python3.12/site-packages (from ipython>=6.1.0->ipywidgets) (2.19.2)
Requirement already satisfied: stack_data in /usr/local/lib/python3.12/site-packages (from ipython>=6.1.0->ipywidgets) (0.6.3)
Requirement already satisfied: parso<0.9.0,>=0.8.4 in /usr/local/lib/python3.12/site-packages (from jedi>=0.16->ipython>=6.1.0->ipywidgets) (0.8.5)
Requirement already satisfied: ptyprocess>=0.5 in /usr/local/lib/python3.12/site-packages (from pexpect>4.3->ipython>=6.1.0->ipywidgets) (0.7.0)
Requirement already satisfied: wcwidth in /usr/local/lib/python3.12/site-packages (from prompt_toolkit<3.1.0,>=3.0.41->ipython>=6.1.0->ipywidgets) (0.2.14)
Requirement already satisfied: executing>=1.2.0 in /usr/local/lib/python3.12/site-packages (from stack_data->ipython>=6.1.0->ipywidgets) (2.2.1)
Requirement already satisfied: asttokens>=2.1.0 in /usr/local/lib/python3.12/site-packages (from stack_data->ipython>=6.1.0->ipywidgets) (3.0.0)
Requirement already satisfied: pure-eval in /usr/local/lib/python3.12/site-packages (from stack_data->ipython>=6.1.0->ipywidgets) (0.2.3)
Downloading ipywidgets-8.1.7-py3-none-any.whl (139 kB)
Downloading jupyterlab_widgets-3.0.15-py3-none-any.whl (216 kB)
Downloading widgetsnbextension-4.0.14-py3-none-any.whl (2.2 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 2.2/2.2 MB 48.2 MB/s eta 0:00:00
Installing collected packages: widgetsnbextension, jupyterlab_widgets, ipywidgets
Successfully installed ipywidgets-8.1.7 jupyterlab_widgets-3.0.15 widgetsnbextension-4.0.14

[notice] A new release of pip is available: 25.0.1 -> 25.2
[notice] To update, run: pip install --upgrade pip


$ pip install beautifulsoup4
Defaulting to user installation because normal site-packages is not writeable
Requirement already satisfied: beautifulsoup4 in /usr/local/lib/python3.12/site-packages (4.13.3)
Requirement already satisfied: soupsieve>1.2 in /usr/local/lib/python3.12/site-packages (from beautifulsoup4) (2.6)
Requirement already satisfied: typing-extensions>=4.0.0 in /usr/local/lib/python3.12/site-packages (from beautifulsoup4) (4.13.2)

[notice] A new release of pip is available: 25.0.1 -> 25.2
[notice] To update, run: pip install --upgrade pip
  
```
## SAP BTP Multitenant App - Service Dependencies Chart


```mermaid
---
title: Service Dependencies Chart
---
mindmap
  root((SAP BTP Multitenant App))
    Platform Services
      SAP BTP Kyma, Runtime
      Application Router
      SaaS Provisioning Service
      Service Manager
    Security Services
      XSUAA (Authorization)
      Identity Authentication
      Credential Store
      Audit Log Service
    Persistancy Services
      SAP HANA Cloud
      HDI Container Service
      PostgreSQL
      Redis Cache with Cloud Manager module
    Integration Services
      Destination Service
      Connectivity Service
      Transparent Proxy Kyma module
      API Management
      Event Mesh
    Monitoring Services
      Application Logging
      Application Performance Monitoring
      Alert Notification
      Cloud Logging
    Development Services
      VSCode
      ArgoCDaaS
      Git Repository
```
