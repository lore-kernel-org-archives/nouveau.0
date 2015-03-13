From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 85570] DPMS does not turn off LCD backlight on G73
 (NV4B) [GeForce 7600 GS]
Date: Fri, 13 Mar 2015 21:19:04 +0000
Message-ID: <bug-85570-8800-4G6VMc3uIv@http.bugs.freedesktop.org/>
References: <bug-85570-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1675367725=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-85570-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1675367725==
Content-Type: multipart/alternative; boundary="1426281544.E82A72.17059"; charset="UTF-8"


--1426281544.E82A72.17059
Date: Fri, 13 Mar 2015 21:19:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=85570

Erik van Pienbroek <erik-freedesktop-bugzilla-7hpmIAI+aCYpZwe9G04TCw@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |erik-freedesktop-bugzilla@v
                   |                            |anpienbroek.nl

--- Comment #1 from Erik van Pienbroek <erik-freedesktop-bugzilla-7hpmIAI+aCYpZwe9G04TCw@public.gmane.org> ---
Hi,

I'm also on Fedora and have been observing similar issues on my Dell XPS
17/GeForce GT 555M where the backlight of the internal display doesn't turn off
any more (xset dpms force off) starting with early kernel 3.16 snapshots (git
tag v3.15-9837-g682b7c1c8ea8 was the first one to be broken). This was reported
to Red Hat bugzilla @ https://bugzilla.redhat.com/show_bug.cgi?id=1123661 which
is currently still open.

In this bug report I've found out which exact commit is likely to be the cause
of my backlight issue and I've also prepared a patch which resolves the issue
for me. Perhaps it will resolve your backlight issue as well.

If you want to try it out yourself, you can find a test kernel build @
https://koji.fedoraproject.org/koji/taskinfo?taskID=9172516 which can be
installed with 'yum install
http://kojipkgs.fedoraproject.org//work/tasks/2518/9172518/kernel-core-4.0.0-0.rc2.git2.1.bug1123661.fc22.x86_64.rpm
http://kojipkgs.fedoraproject.org//work/tasks/2518/9172518/kernel-modules-4.0.0-0.rc2.git2.1.bug1123661.fc22.x86_64.rpm'

This kernel is targeted for Fedora 22 (currently in Alpha) but should also work
fine on Fedora 20 and 21.

To make a fair comparison you should also try the regular kernel (without the
patch) which can be installed with 'yum install
http://kojipkgs.fedoraproject.org//packages/kernel/4.0.0/0.rc2.git2.1.fc22/x86_64/kernel-core-4.0.0-0.rc2.git2.1.fc22.x86_64.rpm
http://kojipkgs.fedoraproject.org//packages/kernel/4.0.0/0.rc2.git2.1.fc22/x86_64/kernel-modules-4.0.0-0.rc2.git2.1.fc22.x86_64.rpm'

Could you test if this also resolves your backlight issue?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1426281544.E82A72.17059
Date: Fri, 13 Mar 2015 21:19:04 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:erik-freedesktop-bugzilla&#64;vanpienbroek.nl" title="Erik van Pienbroek &lt;erik-freedesktop-bugzilla&#64;vanpienbroek.nl&gt;"> <span class="fn">Erik van Pienbroek</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - DPMS does not turn off LCD backlight on G73 (NV4B) [GeForce 7600 GS]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85570">bug 85570</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>erik-freedesktop-bugzilla&#64;vanpienbroek.nl
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - DPMS does not turn off LCD backlight on G73 (NV4B) [GeForce 7600 GS]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85570#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - DPMS does not turn off LCD backlight on G73 (NV4B) [GeForce 7600 GS]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85570">bug 85570</a>
              from <span class="vcard"><a class="email" href="mailto:erik-freedesktop-bugzilla&#64;vanpienbroek.nl" title="Erik van Pienbroek &lt;erik-freedesktop-bugzilla&#64;vanpienbroek.nl&gt;"> <span class="fn">Erik van Pienbroek</span></a>
</span></b>
        <pre>Hi,

I'm also on Fedora and have been observing similar issues on my Dell XPS
17/GeForce GT 555M where the backlight of the internal display doesn't turn off
any more (xset dpms force off) starting with early kernel 3.16 snapshots (git
tag v3.15-9837-g682b7c1c8ea8 was the first one to be broken). This was reported
to Red Hat bugzilla &#64; <a href="https://bugzilla.redhat.com/show_bug.cgi?id=1123661">https://bugzilla.redhat.com/show_bug.cgi?id=1123661</a> which
is currently still open.

In this bug report I've found out which exact commit is likely to be the cause
of my backlight issue and I've also prepared a patch which resolves the issue
for me. Perhaps it will resolve your backlight issue as well.

If you want to try it out yourself, you can find a test kernel build &#64;
<a href="https://koji.fedoraproject.org/koji/taskinfo?taskID=9172516">https://koji.fedoraproject.org/koji/taskinfo?taskID=9172516</a> which can be
installed with 'yum install
<a href="http://kojipkgs.fedoraproject.org//work/tasks/2518/9172518/kernel-core-4.0.0-0.rc2.git2.1.bug1123661.fc22.x86_64.rpm">http://kojipkgs.fedoraproject.org//work/tasks/2518/9172518/kernel-core-4.0.0-0.rc2.git2.1.bug1123661.fc22.x86_64.rpm</a>
<a href="http://kojipkgs.fedoraproject.org//work/tasks/2518/9172518/kernel-modules-4.0.0-0.rc2.git2.1.bug1123661.fc22.x86_64.rpm">http://kojipkgs.fedoraproject.org//work/tasks/2518/9172518/kernel-modules-4.0.0-0.rc2.git2.1.bug1123661.fc22.x86_64.rpm</a>'

This kernel is targeted for Fedora 22 (currently in Alpha) but should also work
fine on Fedora 20 and 21.

To make a fair comparison you should also try the regular kernel (without the
patch) which can be installed with 'yum install
<a href="http://kojipkgs.fedoraproject.org//packages/kernel/4.0.0/0.rc2.git2.1.fc22/x86_64/kernel-core-4.0.0-0.rc2.git2.1.fc22.x86_64.rpm">http://kojipkgs.fedoraproject.org//packages/kernel/4.0.0/0.rc2.git2.1.fc22/x86_64/kernel-core-4.0.0-0.rc2.git2.1.fc22.x86_64.rpm</a>
<a href="http://kojipkgs.fedoraproject.org//packages/kernel/4.0.0/0.rc2.git2.1.fc22/x86_64/kernel-modules-4.0.0-0.rc2.git2.1.fc22.x86_64.rpm">http://kojipkgs.fedoraproject.org//packages/kernel/4.0.0/0.rc2.git2.1.fc22/x86_64/kernel-modules-4.0.0-0.rc2.git2.1.fc22.x86_64.rpm</a>'

Could you test if this also resolves your backlight issue?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1426281544.E82A72.17059--

--===============1675367725==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1675367725==--
