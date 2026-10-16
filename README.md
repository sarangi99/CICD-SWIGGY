# QuickBite — Java WAR app for Jenkins + Tomcat practice

A small **fictional food-ordering demo** inspired by common food-delivery workflows. It is not Swiggy's source code, branding, or production application. Use it to practise Maven, Jenkins pipelines, WAR artifacts, and Tomcat deployment.

## App features
- Restaurant-style landing page with sample food cards
- Add-to-order buttons (demo interaction in the browser)
- Java Servlet health endpoint at `/health`
- Maven build produces `target/quickbite.war`
- JUnit unit test for a small utility class

## Requirements
- JDK 11 or compatible
- Maven 3.8+
- Tomcat 9.x (this app uses `javax.servlet`; Tomcat 10+ uses `jakarta.servlet` and needs migration)

## Run locally
```bash
mvn clean test package
```
The WAR will be at `target/quickbite.war`.

Copy it to Tomcat 9's `webapps` directory:
```bash
sudo cp target/quickbite.war /opt/tomcat/webapps/
```
Adjust the path to your Tomcat installation. Start/restart Tomcat if required, then open:
`http://YOUR_TOMCAT_HOST:8080/quickbite/`

Health endpoint:
`http://YOUR_TOMCAT_HOST:8080/quickbite/health`

Make sure the EC2 security group allows inbound TCP 8080 only from your trusted IP while practising. Do not expose Tomcat Manager or credentials publicly.

## Jenkins setup
1. Install/configure JDK and Maven on the Jenkins controller/agent.
2. In **Manage Jenkins → Tools**, add a Maven installation named exactly `Maven3`, or edit/remove the `tools { maven 'Maven3' }` block in `Jenkinsfile`.
3. Put this project in a Git repository.
4. Create a **Pipeline** job and choose **Pipeline script from SCM**, select Git, and set the repository URL and branch.
5. Run **Build Now**. Jenkins should run `mvn -B clean test package` and archive `target/quickbite.war`.
6. Open the build's **Console Output** and **Test Result** to practise troubleshooting.

## Optional auto-deployment stage
The commented stage in `Jenkinsfile` uses the **Publish Over SSH** plugin. To use it:
- Install the plugin and configure a host named `tomcat-lab` in **Manage Jenkins → System → Publish over SSH**.
- Configure key-based SSH access for the Jenkins agent to the Tomcat EC2 instance.
- Ensure the remote deployment directory is writable by the SSH user, or use a secure deployment account/process.
- Uncomment the stage and update `remoteDirectory` to the actual Tomcat `webapps` path.
- Never put passwords or private keys in the Jenkinsfile or Git repository.

For a first exercise, manually copy `target/quickbite.war` to Tomcat. Once that works, automate deployment.

## Suggested practice tasks
1. Change the app title or menu items, commit, and trigger a Jenkins build.
2. Intentionally break a Java test; inspect why the pipeline fails, then fix it.
3. Add a `Build` stage and a separate `Unit Tests` stage.
4. Add `when` conditions for `main` vs feature branches.
5. Add a build number to the artifact name.
6. Configure deployment to a test Tomcat host, then add a smoke-test stage using `/health`.
7. Add a manual approval (`input`) before production deployment.
8. Create separate Dev and QA deployment stages.

## Troubleshooting
- **Maven not found:** configure Maven in Jenkins Tools or remove the `tools` block and ensure `mvn` is on PATH.
- **Java version mismatch:** check `java -version`, `mvn -version`, and the JDK selected in Jenkins.
- **404 after deployment:** confirm Tomcat is running, the WAR is named `quickbite.war`, and check Tomcat logs.
- **Tomcat 10 error:** use Tomcat 9 for this project or migrate imports/dependencies from `javax.*` to `jakarta.*`.
# CICD-SWIGGY
