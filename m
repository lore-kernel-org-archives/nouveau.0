From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73358] [regression?][nv34] adobe flash + firefox ->
	DATA_ERROR
Date: Sat, 11 Jan 2014 15:24:16 +0000
Message-ID: <bug-73358-8800-lj1Ua4N5qc@http.bugs.freedesktop.org/>
References: <bug-73358-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1360254566=="
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


--===============1360254566==
Content-Type: multipart/alternative; boundary="1389453855.8c6110Ae1.11382"; charset="us-ascii"


--1389453855.8c6110Ae1.11382
Date: Sat, 11 Jan 2014 15:24:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73358

--- Comment #13 from Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I get stuff like this:

[pid 9120] --- Called exec() ---
[pid 9120] +++ exited (status 0) +++
[pid 9119] --- SIGCHLD (Child exited) ---
[pid 9119] --- Called exec() ---
[pid 9122] --- Called exec() ---

No calls with libGL.so.1. This works with glxgears (as with apitrace).

Tried chromium -> would not even start
Firefox or plugin-container itself (i.e. exec ltrace -f -l libGL.so.1
/usr/lib/firefox/plugin-container.real $@ yields no results as well)

There is a lot of forking involved I guess.

Maybe we are hitting some sort of (insane) protection scheme here?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389453855.8c6110Ae1.11382
Date: Sat, 11 Jan 2014 15:24:15 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73358#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [regression?][nv34] adobe flash + firefox -&gt; DATA_ERROR"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73358">bug 73358</a>
              from <span class="vcard"><a class="email" href="mailto:ronald645&#64;gmail.com" title="Ronald &lt;ronald645&#64;gmail.com&gt;"> <span class="fn">Ronald</span></a>
</span></b>
        <pre>I get stuff like this:

[pid 9120] --- Called exec() ---
[pid 9120] +++ exited (status 0) +++
[pid 9119] --- SIGCHLD (Child exited) ---
[pid 9119] --- Called exec() ---
[pid 9122] --- Called exec() ---

No calls with libGL.so.1. This works with glxgears (as with apitrace).

Tried chromium -&gt; would not even start
Firefox or plugin-container itself (i.e. exec ltrace -f -l libGL.so.1
/usr/lib/firefox/plugin-container.real $&#64; yields no results as well)

There is a lot of forking involved I guess.

Maybe we are hitting some sort of (insane) protection scheme here?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389453855.8c6110Ae1.11382--

--===============1360254566==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1360254566==--
