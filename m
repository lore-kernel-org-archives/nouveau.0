From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 48090] Spam of system log with EDID messages
Date: Thu, 01 Nov 2012 19:08:42 +0000
Message-ID: <bug-48090-8800-zttPCqtA80@http.bugs.freedesktop.org/>
References: <bug-48090-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1977668436=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-48090-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1977668436==
Content-Type: multipart/alternative; boundary="1351796922.cfCC4eab2.2349"; charset="us-ascii"


--1351796922.cfCC4eab2.2349
Date: Thu, 1 Nov 2012 19:08:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=48090

Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO
         QA Contact|                            |xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
            Product|Mesa                        |xorg
          Component|Drivers/DRI/nouveau         |Driver/nouveau

--- Comment #2 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Apart from the annoying messages are you experiencing any issues with nouveau ?

A few thing to help out meanwhile 

Try with output polling turned off
$echo 0 > /sys/module/drm_kms_helper/parameters/poll

or provide a customer EDID - see linux/Documentation/EDID/HOWTO.txt and
$modinfo drm_kms_helper

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1351796922.cfCC4eab2.2349
Date: Thu, 1 Nov 2012 19:08:42 +0000
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
   title="NEEDINFO --- - Spam of system log with EDID messages"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=48090">bug 48090</a>
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
   title="NEEDINFO --- - Spam of system log with EDID messages"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=48090#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - Spam of system log with EDID messages"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=48090">bug 48090</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Apart from the annoying messages are you experiencing any issues with nouveau ?

A few thing to help out meanwhile 

Try with output polling turned off
$echo 0 &gt; /sys/module/drm_kms_helper/parameters/poll

or provide a customer EDID - see linux/Documentation/EDID/HOWTO.txt and
$modinfo drm_kms_helper</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1351796922.cfCC4eab2.2349--

--===============1977668436==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1977668436==--
