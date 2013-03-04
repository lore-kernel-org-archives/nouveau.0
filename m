From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61635] glVertexAttribPointer(id, GL_UNSIGNED_BYTE,
 GL_FALSE, ...) does not work
Date: Mon, 04 Mar 2013 19:54:59 +0000
Message-ID: <bug-61635-8800-MOMjv9FYW0@http.bugs.freedesktop.org/>
References: <bug-61635-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0771043772=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-61635-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0771043772==
Content-Type: multipart/alternative; boundary="1362426899.a5121.3169"; charset="us-ascii"


--1362426899.a5121.3169
Date: Mon, 4 Mar 2013 19:54:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61635

--- Comment #4 from rodrigo <rodrigorivascosta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 75914
  --> https://bugs.freedesktop.org/attachment.cgi?id=75914&action=edit
Test case to show the problem with unnormalized attribute pointers of type
GL_UNSIGNED_BYTE

Compile with:

$ gcc -o glbyte -Wall glbyte.c -lglut -lGLEW -lGL

Running with software rendering:

$ LIBGL_ALWAYS_SOFTWARE=1 ./glbyte

draws a beautiful star.

But with hardware rendering:

$ ./glbyte

it draws nothing :(

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1362426899.a5121.3169
Date: Mon, 4 Mar 2013 19:54:59 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - glVertexAttribPointer(id, GL_UNSIGNED_BYTE, GL_FALSE,...) does not work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61635#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - glVertexAttribPointer(id, GL_UNSIGNED_BYTE, GL_FALSE,...) does not work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61635">bug 61635</a>
              from <span class="vcard"><a class="email" href="mailto:rodrigorivascosta&#64;gmail.com" title="rodrigo &lt;rodrigorivascosta&#64;gmail.com&gt;"> <span class="fn">rodrigo</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=75914" name="attach_75914" title="Test case to show the problem with unnormalized attribute pointers of type GL_UNSIGNED_BYTE">attachment 75914</a> <a href="attachment.cgi?id=75914&amp;action=edit" title="Test case to show the problem with unnormalized attribute pointers of type GL_UNSIGNED_BYTE">[details]</a></span>
Test case to show the problem with unnormalized attribute pointers of type
GL_UNSIGNED_BYTE

Compile with:

$ gcc -o glbyte -Wall glbyte.c -lglut -lGLEW -lGL

Running with software rendering:

$ LIBGL_ALWAYS_SOFTWARE=1 ./glbyte

draws a beautiful star.

But with hardware rendering:

$ ./glbyte

it draws nothing :(</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1362426899.a5121.3169--

--===============0771043772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0771043772==--
