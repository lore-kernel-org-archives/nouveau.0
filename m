From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78441] [NV46] X does not start under kernel 3.13.x
Date: Fri, 30 May 2014 19:43:40 +0000
Message-ID: <bug-78441-8800-3hyTodbbrb@http.bugs.freedesktop.org/>
References: <bug-78441-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1602188018=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-78441-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1602188018==
Content-Type: multipart/alternative; boundary="1401479020.CC8FD4E1.24359"; charset="us-ascii"


--1401479020.CC8FD4E1.24359
Date: Fri, 30 May 2014 19:43:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78441

--- Comment #9 from aebenjam-gGaKbNYk6w1Wk0Htik3J/w@public.gmane.org ---
So, I'm not sure about doing a bisect, but you can download the source RPMs for
the two versions kernel-3.12.11-201.fc19 and kernel-3.13.4-100.fc19 which Red
Hat released, here:

http://koji.fedoraproject.org/koji/buildinfo?buildID=498402

and

http://koji.fedoraproject.org/koji/buildinfo?buildID=499637

You can download the .src.rpm easily and then diff the nouveau trees.  I can
attach that diff if you like.

Thing is I'm not enough of a developer to (easily) take that any further.  I'm
happy to help, but otherwise I'm an IT geek and out of my depth trying to work
on video drivers.  Sorry.

Let me know if I can assist further.  Otherwise, for the moment, I'm stuck on a
3.12.x kernel.  :(

Adam

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1401479020.CC8FD4E1.24359
Date: Fri, 30 May 2014 19:43:40 +0000
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
   title="NEW --- - [NV46] X does not start under kernel 3.13.x"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78441#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV46] X does not start under kernel 3.13.x"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78441">bug 78441</a>
              from <span class="vcard"><a class="email" href="mailto:aebenjam&#64;opentext.com" title="aebenjam&#64;opentext.com">aebenjam&#64;opentext.com</a>
</span></b>
        <pre>So, I'm not sure about doing a bisect, but you can download the source RPMs for
the two versions kernel-3.12.11-201.fc19 and kernel-3.13.4-100.fc19 which Red
Hat released, here:

<a href="http://koji.fedoraproject.org/koji/buildinfo?buildID=498402">http://koji.fedoraproject.org/koji/buildinfo?buildID=498402</a>

and

<a href="http://koji.fedoraproject.org/koji/buildinfo?buildID=499637">http://koji.fedoraproject.org/koji/buildinfo?buildID=499637</a>

You can download the .src.rpm easily and then diff the nouveau trees.  I can
attach that diff if you like.

Thing is I'm not enough of a developer to (easily) take that any further.  I'm
happy to help, but otherwise I'm an IT geek and out of my depth trying to work
on video drivers.  Sorry.

Let me know if I can assist further.  Otherwise, for the moment, I'm stuck on a
3.12.x kernel.  :(

Adam</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1401479020.CC8FD4E1.24359--

--===============1602188018==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1602188018==--
