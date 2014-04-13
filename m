From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77361] [nve7] nouveau not working on 3.13 linux
	kernel
Date: Sun, 13 Apr 2014 10:32:46 +0000
Message-ID: <bug-77361-8800-DL9072Yumi@http.bugs.freedesktop.org/>
References: <bug-77361-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1471255688=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77361-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1471255688==
Content-Type: multipart/alternative; boundary="1397385166.D5db541.23223"; charset="us-ascii"


--1397385166.D5db541.23223
Date: Sun, 13 Apr 2014 10:32:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77361

--- Comment #16 from sam.halliday-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Hi Emil,

Yes the logs are probably different because I have done an apt-get upgrade
since the last run. I'm not actively using that root mount, so I don't think I
could have changed anything (but of course, all it takes is one unwitting
package removal).

I've attached the logs for when I don't have an xorg.conf. BTW, the xorg.conf
was working for me before the kernel upgrade... and I can no longer use the
older kernel as Jessie now only distributes the 13 line of kernels.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1397385166.D5db541.23223
Date: Sun, 13 Apr 2014 10:32:46 +0000
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
   title="NEW --- - [nve7] nouveau not working on 3.13 linux kernel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77361#c16">Comment # 16</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nve7] nouveau not working on 3.13 linux kernel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77361">bug 77361</a>
              from <span class="vcard"><a class="email" href="mailto:sam.halliday&#64;gmail.com" title="sam.halliday&#64;gmail.com">sam.halliday&#64;gmail.com</a>
</span></b>
        <pre>Hi Emil,

Yes the logs are probably different because I have done an apt-get upgrade
since the last run. I'm not actively using that root mount, so I don't think I
could have changed anything (but of course, all it takes is one unwitting
package removal).

I've attached the logs for when I don't have an xorg.conf. BTW, the xorg.conf
was working for me before the kernel upgrade... and I can no longer use the
older kernel as Jessie now only distributes the 13 line of kernels.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1397385166.D5db541.23223--

--===============1471255688==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1471255688==--
