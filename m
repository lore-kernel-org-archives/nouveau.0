From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93934] DRI_PRIME=1: DeadIsland crash
Date: Sat, 30 Jan 2016 02:40:59 +0000
Message-ID: <bug-93934-8800-IlvPAXXFkn@http.bugs.freedesktop.org/>
References: <bug-93934-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0937980771=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93934-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0937980771==
Content-Type: multipart/alternative; boundary="14541216591.380a.32056";
 charset="UTF-8"


--14541216591.380a.32056
Date: Sat, 30 Jan 2016 02:40:59 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=93934

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Mesa 11.1.1 has been released, you should definitely try updating. (You appear
to be using the 11.1.0 release.) It appears you're self-compiling... please be
aware that most games on Steam are 32-bit, so the libraries you build have to
match.

Either way, the log you attached provides no information as to the issue.
Probably the easiest course of action is to apitrace the program. There's some
advice on how to do that here: https://github.com/apitrace/apitrace/wiki/Steam

Alternatively try running it in gdb and seeing what the problem is. Try getting
a debug mesa build, perhaps you'll get more information with that.

If there's a demo/free-to-play version of the game which reproduces this issue,
I could have a look directly.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.
--14541216591.380a.32056
Date: Sat, 30 Jan 2016 02:40:59 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - DRI_PRIME=1: DeadIsland crash"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93934#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - DRI_PRIME=1: DeadIsland crash"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93934">bug 93934</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Mesa 11.1.1 has been released, you should definitely try updating. (You appear
to be using the 11.1.0 release.) It appears you're self-compiling... please be
aware that most games on Steam are 32-bit, so the libraries you build have to
match.

Either way, the log you attached provides no information as to the issue.
Probably the easiest course of action is to apitrace the program. There's some
advice on how to do that here: <a href="https://github.com/apitrace/apitrace/wiki/Steam">https://github.com/apitrace/apitrace/wiki/Steam</a>

Alternatively try running it in gdb and seeing what the problem is. Try getting
a debug mesa build, perhaps you'll get more information with that.

If there's a demo/free-to-play version of the game which reproduces this issue,
I could have a look directly.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14541216591.380a.32056--

--===============0937980771==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0937980771==--
