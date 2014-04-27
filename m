From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54700] Distorted graphics (double cursor) with
 GeForce 4200Go (NV28)
Date: Sun, 27 Apr 2014 08:48:57 +0000
Message-ID: <bug-54700-8800-nOj66oaMHh@http.bugs.freedesktop.org/>
References: <bug-54700-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0331536537=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54700-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0331536537==
Content-Type: multipart/alternative; boundary="1398588537.d5bdeBDa4.14318"; charset="us-ascii"


--1398588537.d5bdeBDa4.14318
Date: Sun, 27 Apr 2014 08:48:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=54700

--- Comment #56 from nv28m <nv28m-Y8qEzhMunLyT9ig0jae3mg@public.gmane.org> ---
Doing a suspend to RAM restores the original trashing behaviour. I'm not sure,
but maybe the screen update is slower as well now.

This is a Dell D800:
01:00.0 VGA compatible controller: NVIDIA Corporation NV28M [GeForce4 Ti 4200
Go AGP 8x] (rev a1)

X.Org X Server 1.15.1
Release Date: 2014-04-13
[   263.867] X Protocol Version 11, Revision 0
[   263.867] Build Operating System: Linux 3.2.0-4-amd64 i686 Debian
[   263.867] Current Operating System: Linux dell 3.13-1-686-pae #1 SMP Debian
3.13.7-1 (2014-03-25) i686
[   263.867] Kernel command line: BOOT_IMAGE=/vmlinuz-3.13-1-686-pae-mine2
root=/dev/mapper/root ro processor.ignore_ppc=1 quiet
[   263.867] Build Date: 15 April 2014  07:46:36PM
[   263.867] xorg-server 2:1.15.1-1 (http://www.debian.org/support)
[   263.873] (II) NOUVEAU driver Date:   Thu Nov 7 14:56:48 2013 +1000

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1398588537.d5bdeBDa4.14318
Date: Sun, 27 Apr 2014 08:48:57 +0000
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
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700#c56">Comment # 56</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700">bug 54700</a>
              from <span class="vcard"><a class="email" href="mailto:nv28m&#64;freemail.hu" title="nv28m &lt;nv28m&#64;freemail.hu&gt;"> <span class="fn">nv28m</span></a>
</span></b>
        <pre>Doing a suspend to RAM restores the original trashing behaviour. I'm not sure,
but maybe the screen update is slower as well now.

This is a Dell D800:
01:00.0 VGA compatible controller: NVIDIA Corporation NV28M [GeForce4 Ti 4200
Go AGP 8x] (rev a1)

X.Org X Server 1.15.1
Release Date: 2014-04-13
[   263.867] X Protocol Version 11, Revision 0
[   263.867] Build Operating System: Linux 3.2.0-4-amd64 i686 Debian
[   263.867] Current Operating System: Linux dell 3.13-1-686-pae #1 SMP Debian
3.13.7-1 (2014-03-25) i686
[   263.867] Kernel command line: BOOT_IMAGE=/vmlinuz-3.13-1-686-pae-mine2
root=/dev/mapper/root ro processor.ignore_ppc=1 quiet
[   263.867] Build Date: 15 April 2014  07:46:36PM
[   263.867] xorg-server 2:1.15.1-1 (<a href="http://www.debian.org/support">http://www.debian.org/support</a>)
[   263.873] (II) NOUVEAU driver Date:   Thu Nov 7 14:56:48 2013 +1000</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1398588537.d5bdeBDa4.14318--

--===============0331536537==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0331536537==--
