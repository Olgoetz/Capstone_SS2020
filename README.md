# Capstone SS 2020 - "Modern Cloud Engineering"

## Introduction

Within the context of modern cloud engineering a serverless architecture with automated deployment is of high signficance. On the hand it helps to minimize costs and on the other hand it reduces human errors. <br>
This repo is for educational puproses and highlights the simplicity of automated deployment.

# Prerequisites

- nodejs
- aws cli (configured with credentials with enough rights to deploy on AWS)
- terraform

# Getting started

1. Clone the this repo.
2. Run `npm install`in `app/client`and `app/server` to install dependencies
3. `cd` into `terraform/`
   ```
   $ terraform init
   $ terraform plan -out myplan
   $ terraform apply myplan
   ```
4. Use the exposed endpoint in the output to access the app and api endpoint.
5. `cd` into `terraform/` and clean up the resources
   ```
   $ terraform destroy
   ```

# File structure
- 📂 __Capstone\-Uni\-SS2020__
   - 📄 [Capstone\_SS2020.pptx](Capstone_SS2020.pptx)
   - 📄 [README.md](README.md)
   - 📂 __app__
     - 📂 __client__
       - 📄 [README.md](app/client/README.md)
       - 📄 [node\_modules](app/client/node_modules)
       - 📄 [package\-lock.json](app/client/package-lock.json)
       - 📄 [package.json](app/client/package.json)
       - 📂 __public__
         - 📄 [favicon.ico](app/client/public/favicon.ico)
         - 📄 [index.html](app/client/public/index.html)
         - 📄 [logo192.png](app/client/public/logo192.png)
         - 📄 [logo512.png](app/client/public/logo512.png)
         - 📄 [manifest.json](app/client/public/manifest.json)
         - 📄 [robots.txt](app/client/public/robots.txt)
       - 📂 __src__
         - 📄 [App.css](app/client/src/App.css)
         - 📄 [App.js](app/client/src/App.js)
         - 📄 [App.test.js](app/client/src/App.test.js)
         - 📂 __components__
           - 📂 __card__
             - 📄 [card.component.jsx](app/client/src/components/card/card.component.jsx)
             - 📄 [card.styles.css](app/client/src/components/card/card.styles.css)
           - 📂 __card\-list__
             - 📄 [card\-list.component.jsx](app/client/src/components/card-list/card-list.component.jsx)
             - 📄 [card\-list.styles.css](app/client/src/components/card-list/card-list.styles.css)
           - 📂 __search\-field__
             - 📄 [search\-field.component.jsx](app/client/src/components/search-field/search-field.component.jsx)
             - 📄 [search\-field.styles.css](app/client/src/components/search-field/search-field.styles.css)
         - 📂 __constants__
           - 📄 [apiUrl.js](app/client/src/constants/apiUrl.js)
         - 📄 [index.css](app/client/src/index.css)
         - 📄 [index.js](app/client/src/index.js)
         - 📄 [logo.svg](app/client/src/logo.svg)
         - 📄 [serviceWorker.js](app/client/src/serviceWorker.js)
         - 📄 [setupTests.js](app/client/src/setupTests.js)
     - 📂 __server__
       - 📄 [app.js](app/server/app.js)
       - 📄 [lambda.js](app/server/lambda.js)
       - 📄 [node\_modules](app/server/node_modules)
       - 📄 [package\-lock.json](app/server/package-lock.json)
       - 📄 [package.json](app/server/package.json)
       - 📂 __routes__
         - 📂 __api__
           - 📄 [constants.js](app/server/routes/api/constants.js)
           - 📄 [users.js](app/server/routes/api/users.js)
       - 📄 [server.js](app/server/server.js)
   - 📂 __terraform__
     - 📂 __api\_gateway__
       - 📄 [main.tf](terraform/api_gateway/main.tf)
       - 📄 [outputs.tf](terraform/api_gateway/outputs.tf)
       - 📄 [variables.tf](terraform/api_gateway/variables.tf)
     - 📂 __lambda__
       - 📄 [main.tf](terraform/lambda/main.tf)
       - 📄 [outputs.tf](terraform/lambda/outputs.tf)
       - 📄 [variables.tf](terraform/lambda/variables.tf)
     - 📄 [lambda\_function\_payload.zip](terraform/lambda_function_payload.zip)
     - 📄 [main.tf](terraform/main.tf)
     - 📄 [myplan](terraform/myplan)
     - 📄 [outputs.tf](terraform/outputs.tf)
     - 📂 __s3__
       - 📄 [main.tf](terraform/s3/main.tf)
       - 📄 [output.tf](terraform/s3/output.tf)
       - 📄 [variables.tf](terraform/s3/variables.tf)
     - 📄 [terraform.tfstate](terraform/terraform.tfstate)
     - 📄 [terraform.tfstate.backup](terraform/terraform.tfstate.backup)
     - 📄 [variables.tf](terraform/variables.tf)

