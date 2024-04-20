pipeline {
    agent any

    stages {
        stage('Install Dependencies') {
            steps {
                // Bersihkan folder node_modules jika diperlukan
                sh 'rm -rf node_modules'
                // Jalankan npm install
                sh 'npm install'
            }
        }
    }

    post {
        always {
            // Tambahkan langkah-langkah pembersihan jika diperlukan
            // Contoh: Hapus node_modules setelah selesai
            sh 'rm -rf node_modules'
        }
    }
}
