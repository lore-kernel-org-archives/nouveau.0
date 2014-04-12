From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77371] [NVA3] gpu lockup unless noaccel=1
Date: Sat, 12 Apr 2014 19:20:24 +0000
Message-ID: <bug-77371-8800-nRQXgiQ6gb@http.bugs.freedesktop.org/>
References: <bug-77371-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1603684908=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77371-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1603684908==
Content-Type: multipart/alternative; boundary="1397330424.8BeC1.30673"; charset="us-ascii"


--1397330424.8BeC1.30673
Date: Sat, 12 Apr 2014 19:20:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77371

--- Comment #3 from jw.hendy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Created attachment 97266
  --> https://bugs.freedesktop.org/attachment.cgi?id=97266&action=edit
dmesg after noaccel=1 on Arch x86_64, prior to startx

Booted with `nouveau.noaccel=1` appended to kernel line, piped dmesg prior to
starting X

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1397330424.8BeC1.30673
Date: Sat, 12 Apr 2014 19:20:24 +0000
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
   title="NEW --- - [NVA3] gpu lockup unless noaccel=1"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77371#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA3] gpu lockup unless noaccel=1"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77371">bug 77371</a>
              from <span class="vcard"><a class="email" href="mailto:jw.hendy&#64;gmail.com" title="jw.hendy&#64;gmail.com">jw.hendy&#64;gmail.com</a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=97266" name="attach_97266" title="dmesg after noaccel=1 on Arch x86_64, prior to startx">attachment 97266</a> <a href="attachment.cgi?id=97266&amp;action=edit" title="dmesg after noaccel=1 on Arch x86_64, prior to startx">[details]</a></span>
dmesg after noaccel=1 on Arch x86_64, prior to startx

Booted with `nouveau.noaccel=1` appended to kernel line, piped dmesg prior to
starting X</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1397330424.8BeC1.30673--

--===============1603684908==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1603684908==--
