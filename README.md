

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/aperim/docker-opencanary">
    <img src="https://user-images.githubusercontent.com/4564803/103496858-da9fd900-4e93-11eb-8ec0-bc2cb4118e88.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">OpenCanary Container</h3>

  <p align="center">
    Not affiliated with the OpenCanary project.
    <br />
    <a href="https://github.com/thinkst/opencanary"><strong>OpenCanary by Thinkst Applied Research »</strong></a>
    <br />
    <br />
    <a href="https://github.com/aperim/docker-opencanary/issues">Report Bug</a>
    ·
    <a href="https://github.com/aperim/docker-opencanary/issues">Request Feature</a>
  </p>
</p>



<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgements">Acknowledgements</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

[![Product Name Screen Shot][product-screenshot]](http://thinkst.com/)

There are a few containers for OpenCanary publically available. This is just another one. It's simple, easily updated, and pretty slim.

### Built With

I'm lazy so this was made inside VSCode and tested with docker.
* [Visual Studio Code](https://code.visualstudio.com)
* [Docker](https://docs.docker.com/engine/install/)



<!-- GETTING STARTED -->
## Getting Started

There isn't much to do - you need a network, and something to run the container in.

We use [VMware ESXi](https://www.vmware.com/au/products/esxi-and-esx.html) and for the guest operating system [Photon OS](https://vmware.github.io/photon/). 

### Prerequisites

Not much - you need docker (or any other suitable container system such as [Podman](https://podman.io/)).
* docker
  ```sh
  $ docker --version
  Docker version 20.10.0, build 7287ab3
  ```

### Starting OpenCanary using default config

1. Get ready
2. Start the container
   ```sh
   $ docker run -d --network host --name opencanary --restart always ghcr.io/aperim/opencanary:latest
   ```
3. Watch those logs
   ```sh
   docker logs -f opencanary
   ```


<!-- USAGE EXAMPLES -->
## Usage

You will get nearly no value out of OpenCanary unless you supply your own configuration file. To run the container and supply your own configuration file - do something like:
```sh
  $ docker run -d --network host --name opencanary --restart always -v ~/opencanary.conf:/etc/opencanaryd/opencanary.conf ghcr.io/aperim/opencanary:latest 
```

_For more details about the configuration file, please refer to the OpenCanary [Documentation](https://opencanary.readthedocs.io/en/latest/)_



<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/aperim/docker-opencanary/issues) for a list of proposed features (and known issues).



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request



<!-- LICENSE -->
## License

Distributed under the APACHE-2 License. See `LICENSE` for more information.



<!-- CONTACT -->
## Contact

Troy - [@troykelly](http://keybase.io/troykelly) - hello@aperim.com

Project Link: [https://github.com/aperim/docker-opencanary](https://github.com/aperim/docker-opencanary)



<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements
* [GitHub Readme Template](https://github.com/othneildrew/Best-README-Template)




<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/aperim/docker-opencanary.svg?style=for-the-badge
[contributors-url]: https://github.com/aperim/docker-opencanary/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/aperim/docker-opencanary.svg?style=for-the-badge
[forks-url]: https://github.com/aperim/docker-opencanary/network/members
[stars-shield]: https://img.shields.io/github/stars/aperim/docker-opencanary.svg?style=for-the-badge
[stars-url]: https://github.com/aperim/docker-opencanary/stargazers
[issues-shield]: https://img.shields.io/github/issues/aperim/docker-opencanary.svg?style=for-the-badge
[issues-url]: https://github.com/aperim/docker-opencanary/issues
[license-shield]: https://img.shields.io/github/license/aperim/docker-opencanary.svg?style=for-the-badge
[license-url]: https://github.com/aperim/docker-opencanary/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/company/aperim
[product-screenshot]: https://user-images.githubusercontent.com/4564803/103497899-112b2300-4e97-11eb-9f42-dee91268d47f.png