From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73358] [regression?][nv34] adobe flash + firefox ->
	DATA_ERROR
Date: Fri, 10 Jan 2014 21:44:03 +0000
Message-ID: <bug-73358-8800-otMLFFFlqB@http.bugs.freedesktop.org/>
References: <bug-73358-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1940959111=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-73358-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1940959111==
Content-Type: multipart/alternative; boundary="1389390242.0beD1.31574"; charset="us-ascii"


--1389390242.0beD1.31574
Date: Fri, 10 Jan 2014 21:44:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73358

--- Comment #9 from Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I tried to do this but browsers are so complicated it does not work.

- apitrace trace firefox does not work
- apitrace trace chromium does not work
- replacing firefox plugin loader with script calling apitrace does not work
- replacing chromium exec with a script that catches the plugin instances
yielded no results
- I downloaded fp_11.2.1.102.63_archive.zip and extracted the standalone
player. Attaching apitrace seems to work. Other then the other 4 attempts it
sucessfully catches the libGL calls. However, it only accepts direct links to
.swf files. This will not work for youtube.

Do you have any ideas?

I have the latest apitrace from git if that matters.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389390242.0beD1.31574
Date: Fri, 10 Jan 2014 21:44:02 +0000
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
   title="NEW --- - [regression?][nv34] adobe flash + firefox -&gt; DATA_ERROR"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73358#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [regression?][nv34] adobe flash + firefox -&gt; DATA_ERROR"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73358">bug 73358</a>
              from <span class="vcard"><a class="email" href="mailto:ronald645&#64;gmail.com" title="Ronald &lt;ronald645&#64;gmail.com&gt;"> <span class="fn">Ronald</span></a>
</span></b>
        <pre>I tried to do this but browsers are so complicated it does not work.

- apitrace trace firefox does not work
- apitrace trace chromium does not work
- replacing firefox plugin loader with script calling apitrace does not work
- replacing chromium exec with a script that catches the plugin instances
yielded no results
- I downloaded fp_11.2.1.102.63_archive.zip and extracted the standalone
player. Attaching apitrace seems to work. Other then the other 4 attempts it
sucessfully catches the libGL calls. However, it only accepts direct links to
.swf files. This will not work for youtube.

Do you have any ideas?

I have the latest apitrace from git if that matters.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389390242.0beD1.31574--

--===============1940959111==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1940959111==--
