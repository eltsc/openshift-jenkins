FROM quay.io/openshift/origin-jenkins-agent-base

# ENV GO_VERSION_DEFAULT=1.13.5 \
#     GOROOT=/usr/local/go \
#     GOPATH=/usr/src/go
# ENV PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# WORKDIR /opt
# # RUN curl -L -o /tmp/sonar-scanner.zip https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.3.0.1492.zip && \
# #     unzip /tmp/sonar-scanner.zip && \
# #     mv sonar-scanner-* sonar-scanner && \
# #     ln -s /opt/sonar-scanner/bin/sonar-scanner /usr/local/bin/sonar-scanner && \
# #     chmod 755 /usr/local/bin/sonar-scanner
# RUN if [ -z $GO_VERSION ] ; then GO_VERSION=${GO_VERSION_DEFAULT} ; fi && \
#     curl -L -o /usr/go${GO_VERSION}.linux-amd64.tar.gz https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz && \
#     mkdir -p /usr/src/go/src/redhat && \
#     tar -xzf /usr/go${GO_VERSION}.linux-amd64.tar.gz && \
#     mv $(pwd)/go /usr/local/ && \
#     go get -u github.com/golang/dep/cmd/dep && \
#     chown -R 1001 /usr/src/go && \
#     chown -R 1001 /usr/local/go && \
#     chown -R 1001 ${HOME}/.cache/go-build && \
#     rm -f /usr/go${GO_VERSION}.linux-amd64.tar.gz

# USER 1001
# RUN echo hello
# RUN pwd
# RUN go version

ENV GIT_CRT="-----BEGIN CERTIFICATE-----MIIFcDCCA1igAwIBAgIUJHQ/EGN3P6ZS6xfEbiRb0/LP9JMwDQYJKoZIhvcNAQENBQAwPjEPMA0GA1UEChMGZ2l0bGFiMQ8wDQYDVQQLEwZnaXRsYWIxGjAYBgNVBAMTEUdpdExhYiBIZWxtIENoYXJ0MB4XDTE5MTIyOTA4MjcwMFoXDTI0MTIyNzA4MjcwMFowPjEPMA0GA1UEChMGZ2l0bGFiMQ8wDQYDVQQLEwZnaXRsYWIxGjAYBgNVBAMTEUdpdExhYiBIZWxtIENoYXJ0MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAxTwMXnCdFp65P6T5mOnPDvg4SZaO7ZM5HlAyq1R3vJhWOXlP2TDZYHyTKPxEljoyuB/23aGETClCSR8S0e8mtmbTAiPJAZoSYS/iEtaQqip9e1FSRO11yozcT+BpXzGFuWN+/61BfP7L86FkVMUGfmWcTIesZyPGFd3Z3KRejw2fjwm+LK1gmiqQlc5LL/94W9hKcjFkMmZ0o6JOy9AzlWRBu+x/aumNDC2yyCuLQtH2jGbWkaRL62VTSGyhm+wRQU/zq/tjTUrCcebSx4AKaFRTE+vmHN3n6ot55kDXWtz4nGH2bbohITelUkW8fyAA9FrSuKJ7/fMDzxpI6lzBf+SXGaSu+WKl0kD7NXiKLOPZp0LlyqMR5f3A1Oj1uUK2MrVX58kJhvzaKQG6xlGKOzeDMPAQrSCERONWGASKa/A3gDX1BWh1znjd22FgnODZq+gIUxB+lxtKCrD3tohjO47rDeLy0acHcbTdC3PFRCCaB3JmCC+/M1EALbpnJ815IwIdshUahxnNCxVY4jA93tGHdxtm8KSTMx36T2MlCgnxeKTBLsPHVg/kMV6Rh8tQAJCARw4PXGMKQ69CovI/gQE6Zvig8lp6iV1SwiJcGTdmZXGKY96G1IvV6unsW1Epc1pSS2GIuD5zpebyewmoj+Qj2Q9sOIWYLPypqzv7HjsCAwEAAaNmMGQwDgYDVR0PAQH/BAQDAgEGMBIGA1UdEwEB/wQIMAYBAf8CAQIwHQYDVR0OBBYEFPz+l0YL87xALo6Wi9UlTEkcnmr1MB8GA1UdIwQYMBaAFPz+l0YL87xALo6Wi9UlTEkcnmr1MA0GCSqGSIb3DQEBDQUAA4ICAQCaopAYSQwTF7f71/wd1TMYtj5uThHZ4RF+3skoFvHPM1+dkJgA44buPzLLv+QnHoc3lWeab/AN1eyOdJuoa6P8kL45UCsg0p8eoYVghn26MMjelKl+PaXZcrtABc8HE9U9/ZoZhe5SqEKRJashsWRtKKg8wy6v86om2W8yX901Vr5eaCfeeObLtpSjY32qg3hqq29dYs6IbDMsnC7xN+taMZdqDALV1oo4LDITqSunncT+ulbaUSKpWzo+ac82fSKFuSgsFIgIUeOQG69KL6fYydhAVkO5xngd7efErNhvVlJHiTxpw8lXcfI8+oWkwWn8CXKngjVvKC/h6IKmtwSQZdRQrxNJpsesa2L+FeIh7efq6i3TtLjDRXKu3itpa5f+sHsxs7vYkGRTSBlpIh35pfbFlrmdIF+p2lHC8yvWg2Z6F/p4L7bAVSPy0SYg0a+4Ni9WT/WNui35mFzciCQV/pj4R9QwvEDvFNrFyKqwgYiapUb3kmug53ohrImZ44SodX0QOsTLjL2e2CWEd8F3qQQMNJ+FQxVJpCKFohZqTf65PUf/fLz4wnrn8iY+SyFiAZ6Sg3XoEVW8HFDS5C8eVfeI1x9yj5adT0WKRMOIyFNcGz/xG8Q3JLiIeGsDMB7PZQ6XOK09Wq/zePnrFkLqbfCATMf/Ol7Y9mt8dqHZEQ==-----END CERTIFICATE-----"
RUN echo $GIT_CRT > /etc/pki/ca-trust/source/anchors/gitlab.pem 

ENTRYPOINT [ "/usr/local/bin/run-jnlp-client" ]