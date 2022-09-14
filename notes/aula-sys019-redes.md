# Aula 019 - Redes

## HTTP (Hyper Text Transfer Protocol)

HTTP is a client-server protocol: **requests** are sent by one entity, the network **client**.

Each individual request is sent to a **server**, which handles it and provides an answer, called the **response**.

Between the client and the server there are numerous entities, collectively called **proxies**, which perform different operations and act as gateways or caches, for example.

[An overview of HTTP](https://developer.mozilla.org/en-US/docs/Web/HTTP/Overview)

---

## What is a client?

A network client is a software that runs on a client computer and allows it to establish connectivity with services running on server computers.

## What is a server?

A server is a computer program or a device that provides functionality for clients which are other programs or devices.

A single overall computation is distributed across multiple processes or devices. Servers can provide various functionalities called **services**. These services include sharing data or resources among multiple clients, or performing computation for a client. **Multiple clients can be served by a single server, and a single client can use multiple servers.**

Example of servers may include database servers, mail servers, print servers, file servers, web servers, application servers, and game servers.

## What is a proxy?

Between the client and the server, numerous computers and machines relay the HTTP messages. Those operating at the application layers are generally called proxies.

**Transparent proxies** - Forward on the requests they receive without altering them in any way.

**Non-transparent proxies** - Change the request in some way before passing it along to the server.

Proxies may perform numerous functions:

- Caching (the cache can be public or private, like the browser cache)
- Filtering (like an antivirus scan or parental controls)
- Load balancing (to allow multiple servers to serve the different requests)
- Authentication (to control access to different resources)
- Logging (allowing the storage of historical information)

---

## The HTTP Request Circle

To present a Web page, the browser sends an original request to fetch the HTML document that represents the page. It then parses this file, making additional requests corresponding to execution scripts, layout information (CSS) to display, and sub-resources contained within the page (usually images and videos). The Web browser then mixes these resources to present to the user a complete document, the Web page.

A typical HTTP request / response circle involves multiple requests for sub-resources:

- The browser requests an HTML page. The server returns an **HTML file**.
    * **HTML (Hyper Text Markup Language)** - HTML elements are the building blocks of HTML pages.

- The browser requests a style sheet. The server returns a **CSS file**.
    * **CSS (Cascading Style Sheets)** - Describes how HTML elements are to be displayed.

- The browser requests a JPG image. The server returns a JPG file.
    * You can also request other types of images, videos, audio, etc.

- The browser requests JavaScript code. The server returns a **JS file**.
   * **JavaScript** is a programming language that allows you to implement complex things on web pages

- The browser requests data. The server returns **data** (in **XML** or **JSON**).
    * **XML (eXtensible Markup language)** - Often used for distributing data over the Internet.
    * **JSON (JavaScript Object Notation)** - Lightweight format for storing and transporting data.

---

## HTTP Messages

[Link](https://developer.mozilla.org/en-US/docs/Web/HTTP/Messages)

HTTP messages are how data is exchanged between a server and a client. There are two types of messages: **requests** sent by the client to trigger an action on the server, and **responses**, the answer from the server.

![httpmessages](/assets/images/httpmessages.png)

As seen above, HTTP requests and responses are made of three parts: 1) a **start line**, 2) an **HTTP header** and 3) a **body.**

### Composition of an HTTP Request

1) A request **start line** contains three elements:

    1.1. An **HTTP method**, a verb (like `GET`, `PUT` or `POST`) or a noun (like `HEAD` or `OPTIONS`), that describes the action to be performed.
        * For example, `GET` indicates that a resource should be fetched or `POST` means that data is pushed to the server (creating or modifying a resource, or generating a temporary document to send back).

    1.2. The **request target**, usually a URL, or the absolute path of the protocol, port, and domain are usually characterized by the request context. The format of this request target varies between different HTTP methods. It can be:
    * An absolute path, ultimately followed by a '?' and query string. This is the most common form, known as the origin form, and is used with GET, POST, HEAD, and OPTIONS methods.

        * `POST / HTTP/1.1`
        * `GET /background.png HTTP/1.0`
        * `HEAD /test.html?query=alibaba HTTP/1.1`
        * `OPTIONS /anypage.html HTTP/1.0`

    * A complete URL, known as the absolute form, is mostly used with GET when connected to a proxy.

        * `GET https://developer.mozilla.org/en-US/docs/Web/HTTP/Messages HTTP/1.1`

    * The authority component of a URL, consisting of the domain name and optionally the port (prefixed by a ':'), is called the authority form. It is only used with CONNECT when setting up an HTTP tunnel.

        * `CONNECT developer.mozilla.org:80 HTTP/1.1`

    * The asterisk form, a simple asterisk ('*') is used with OPTIONS, representing the server as a whole.

        * `OPTIONS * HTTP/1.1`

    1.3. The **HTTP version**, which defines the structure of the remaining message, acting as an indicator of the expected version to use for the response.

2) HTTP **headers** from a request follow the same basic structure of an HTTP header: a case-insensitive string followed by a colon (':') and a value whose structure depends upon the header.

![httpheader](/assets/images/httpheader.png)

3) At the end, the **body**. Not all requests have one: requests fetching resources, like `GET`, `HEAD`, `DELETE`, or `OPTIONS`, usually don't need one. Some requests send data to the server in order to update it: as often the case with `POST` requests (containing HTML form data).

### Composition of an HTTP Response

1) The start line of an HTTP response, called the **status line**, contains:

    * The **protocol version**, usually `HTTP/1.1`.
    * A **status code**, indicating success or failure of the request.
        * Common status codes are `200` (Success / OK), `404` (Not Found), or `302` (Temporary Redirect).
    * A **status text**. A brief, purely informational, textual description of the status code to help a human understand the HTTP message.

    A typical status line looks like: `HTTP/1.1 404 Not Found.`

2) A response **header** follows the same rules as any other HTTP header.

![httpheader-response](/assets/images/httpheader-response.png)

3) The last part of a response is the **body**. Not all responses have one: responses with a status code that sufficiently answers the request without the need for corresponding payload (like 201 Created or 204 No Content) usually don't.


# Exercises

Solutions to class exercises [here](/exercises/aula-sys019-redes-exercises.md) - in Portuguese