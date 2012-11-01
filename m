From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56601] 9600m GT HDMI output no video or audio.
Date: Thu, 01 Nov 2012 19:00:16 +0000
Message-ID: <bug-56601-8800-0SdXlbm2pj@http.bugs.freedesktop.org/>
References: <bug-56601-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0615406370=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-56601-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0615406370==
Content-Type: multipart/alternative; boundary="1351796416.a4A1E2d72.801"; charset="us-ascii"


--1351796416.a4A1E2d72.801
Date: Thu, 1 Nov 2012 19:00:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56601

Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO
         QA Contact|                            |xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
            Product|Mesa                        |xorg
          Component|Drivers/DRI/nouveau         |Driver/nouveau

--- Comment #2 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi Kevin

Does your LVDS work correctly ?
When are you connecting your TV - during boot or later?

Here are a few thing for you to try
1. Boot without "video=uvesafb:1280x800-32" from your command line
2. Boot your system without the TV, then connect it after X is up
3. Boot your system with the TV plugged in
- do you see any output on it ?
- if not attach the dmesg

Consider attaching dmesg output [1] of some of the above do not work

[1] http://nouveau.freedesktop.org/wiki/Bugs

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1351796416.a4A1E2d72.801
Date: Thu, 1 Nov 2012 19:00:16 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - 9600m GT HDMI output no video or audio."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56601">bug 56601</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>NEEDINFO
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">QA Contact</td>
           <td>
               &nbsp;
           </td>
           <td>xorg-team&#64;lists.x.org
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Product</td>
           <td>Mesa
           </td>
           <td>xorg
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Component</td>
           <td>Drivers/DRI/nouveau
           </td>
           <td>Driver/nouveau
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - 9600m GT HDMI output no video or audio."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56601#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - 9600m GT HDMI output no video or audio."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56601">bug 56601</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Hi Kevin

Does your LVDS work correctly ?
When are you connecting your TV - during boot or later?

Here are a few thing for you to try
1. Boot without &quot;video=uvesafb:1280x800-32&quot; from your command line
2. Boot your system without the TV, then connect it after X is up
3. Boot your system with the TV plugged in
- do you see any output on it ?
- if not attach the dmesg

Consider attaching dmesg output [1] of some of the above do not work

[1] <a href="http://nouveau.freedesktop.org/wiki/Bugs">http://nouveau.freedesktop.org/wiki/Bugs</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1351796416.a4A1E2d72.801--

--===============0615406370==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0615406370==--
