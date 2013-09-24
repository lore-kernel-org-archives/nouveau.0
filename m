From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69768] [NVC1] [regression] machine is unable to
	suspend
Date: Tue, 24 Sep 2013 19:19:51 +0000
Message-ID: <bug-69768-8800-vXhvIkCXVQ@http.bugs.freedesktop.org/>
References: <bug-69768-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0909242726=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69768-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0909242726==
Content-Type: multipart/alternative; boundary="1380050391.fc7cE81.22822"; charset="us-ascii"


--1380050391.fc7cE81.22822
Date: Tue, 24 Sep 2013 19:19:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69768

Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           See Also|                            |https://bugzilla.kernel.org
                   |                            |/show_bug.cgi?id=61791
            Summary|not able to do a suspend    |[NVC1] [regression] machine
                   |                            |is unable to suspend

--- Comment #7 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
As mentioned in IRC, according to your logs your 3.10.9 suspend issues are not
caused by nouveau

Whereas for the 3.11 one it seems that we've introduced a regression

I would recommend a git bisect between 3.10 and 3.11 as there are quite a few
commits related to your card. I would check dmesg on each step to establish
which commit introduced the following messages (and most likely the whole s2r
issue)

nouveau  [     DRM] MM: using COPY0 for buffer copies
nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000401 FAULT at 0x002010 [
IBUS TIMEOUT ]
nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x01000000 FAULT at 0x03a54c [
IBUS TIMEOUT ]

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1380050391.fc7cE81.22822
Date: Tue, 24 Sep 2013 19:19:51 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] [regression] machine is unable to suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69768">bug 69768</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">See Also</td>
           <td>
               &nbsp;
           </td>
           <td>https://bugzilla.kernel.org/show_bug.cgi?id=61791
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>not able to do a suspend
           </td>
           <td>[NVC1] [regression] machine is unable to suspend
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] [regression] machine is unable to suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69768#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] [regression] machine is unable to suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69768">bug 69768</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>As mentioned in IRC, according to your logs your 3.10.9 suspend issues are not
caused by nouveau

Whereas for the 3.11 one it seems that we've introduced a regression

I would recommend a git bisect between 3.10 and 3.11 as there are quite a few
commits related to your card. I would check dmesg on each step to establish
which commit introduced the following messages (and most likely the whole s2r
issue)

nouveau  [     DRM] MM: using COPY0 for buffer copies
nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000401 FAULT at 0x002010 [
IBUS TIMEOUT ]
nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x01000000 FAULT at 0x03a54c [
IBUS TIMEOUT ]</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1380050391.fc7cE81.22822--

--===============0909242726==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0909242726==--
