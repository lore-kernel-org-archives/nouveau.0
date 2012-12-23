From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 55980] X Segfault on second screen resize
Date: Sun, 23 Dec 2012 13:43:01 +0000
Message-ID: <bug-55980-8800-ti1QBZIgGg@http.bugs.freedesktop.org/>
References: <bug-55980-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0740689826=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-55980-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0740689826==
Content-Type: multipart/alternative; boundary="1356270181.Efa61.522"; charset="us-ascii"


--1356270181.Efa61.522
Date: Sun, 23 Dec 2012 13:43:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=55980

Ge@@ru <geaaru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org       |nouveau-PD4FTy7X32lNgt0PjOBp93rCq3LdnpKM@public.gmane.org
                   |                            |rg
          Component|Server/Acceleration/EXA     |Driver/nouveau

--- Comment #6 from Ge@@ru <geaaru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi, i do other test about this problem and I found that problem is relative to
kernel nouveau driver and not to X.

I test this with different xorg-server versions:
- 1.12.4,
- 1.13.0
- 1.13.1 (current installed version)

and with xf86-video-nouveau:

- 1.0.1
- 1.0.2
- 1.0.3
- 1.0.4

and with different kernel:

- 3.7.0
- 3.6.8
- 3.6.4
- 3.5.7
- 3.4.24
- 3.2.35
- 3.0.17

With my test i see that only with 3.0.17 and 3.2.35 all works fine.

I'm sure that problems is on kernel driver.

Are there big changes between 3.2.35 and > 3.4 for nouveau kernel driver ?

I move this bug again to nouveau/driver but I'm not sure that is right. Sorry
if is wrong.

Thanks

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1356270181.Efa61.522
Date: Sun, 23 Dec 2012 13:43:01 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:geaaru&#64;gmail.com" title="Ge&#64;&#64;ru &lt;geaaru&#64;gmail.com&gt;"> <span class="fn">Ge&#64;&#64;ru</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - X Segfault on second screen resize"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=55980">bug 55980</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Assignee</td>
           <td>xorg-team&#64;lists.x.org
           </td>
           <td>nouveau&#64;lists.freedesktop.org
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Component</td>
           <td>Server/Acceleration/EXA
           </td>
           <td>Driver/nouveau
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - X Segfault on second screen resize"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=55980#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - X Segfault on second screen resize"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=55980">bug 55980</a>
              from <span class="vcard"><a class="email" href="mailto:geaaru&#64;gmail.com" title="Ge&#64;&#64;ru &lt;geaaru&#64;gmail.com&gt;"> <span class="fn">Ge&#64;&#64;ru</span></a>
</span></b>
        <pre>Hi, i do other test about this problem and I found that problem is relative to
kernel nouveau driver and not to X.

I test this with different xorg-server versions:
- 1.12.4,
- 1.13.0
- 1.13.1 (current installed version)

and with xf86-video-nouveau:

- 1.0.1
- 1.0.2
- 1.0.3
- 1.0.4

and with different kernel:

- 3.7.0
- 3.6.8
- 3.6.4
- 3.5.7
- 3.4.24
- 3.2.35
- 3.0.17

With my test i see that only with 3.0.17 and 3.2.35 all works fine.

I'm sure that problems is on kernel driver.

Are there big changes between 3.2.35 and &gt; 3.4 for nouveau kernel driver ?

I move this bug again to nouveau/driver but I'm not sure that is right. Sorry
if is wrong.

Thanks</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1356270181.Efa61.522--

--===============0740689826==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0740689826==--
