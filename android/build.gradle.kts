apply plugin: 'com.google.gms.google-services'

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
buildscript {
    dependencies {
        classpath 'com.google.gms:google-services:4.4.0'  // ajouter si pas déjà
    }
}

dependencies {
    implementation platform('com.google.firebase:firebase-bom:34.7.0')
    implementation 'com.google.firebase:firebase-analytics'        // exemple
    implementation 'com.google.firebase:firebase-auth'             // pour Auth
    implementation 'com.google.firebase:firebase-firestore'        // pour Firestore
}
