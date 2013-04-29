From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 62916] NVEnterVT fails with hybrid cards
Date: Mon, 29 Apr 2013 09:33:31 +0000
Message-ID: <bug-62916-8800-B7L7NaVNYY@http.bugs.freedesktop.org/>
References: <bug-62916-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0552539825=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-62916-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0552539825==
Content-Type: multipart/alternative; boundary="1367228012.6C1Bef3.4399"; charset="us-ascii"


--1367228012.6C1Bef3.4399
Date: Mon, 29 Apr 2013 09:33:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=62916

Maarten Lankhorst <m.b.lankhorst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
           Assignee|nouveau-PD4FTy7X32lNgt0PjOBp93rCq3LdnpKM@public.gmane.org |m.b.lankhorst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
                   |rg                          |

--- Comment #1 from Maarten Lankhorst <m.b.lankhorst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 78590
  --> https://bugs.freedesktop.org/attachment.cgi?id=78590&action=edit
[PATCH] hw/xfree86: Allow xf86SetDesiredModes to succeed if no crtc's are
enabled.

I just noticed the same problem with xserver 1.14, x1.13 worked fine. Hopefully
attached patch fixes it for you too.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1367228012.6C1Bef3.4399
Date: Mon, 29 Apr 2013 09:33:32 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:m.b.lankhorst&#64;gmail.com" title="Maarten Lankhorst &lt;m.b.lankhorst&#64;gmail.com&gt;"> <span class="fn">Maarten Lankhorst</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_ASSIGNED "
   title="ASSIGNED --- - NVEnterVT fails with hybrid cards"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62916">bug 62916</a>
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
           <td>ASSIGNED
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Assignee</td>
           <td>nouveau&#64;lists.freedesktop.org
           </td>
           <td>m.b.lankhorst&#64;gmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_ASSIGNED "
   title="ASSIGNED --- - NVEnterVT fails with hybrid cards"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62916#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_ASSIGNED "
   title="ASSIGNED --- - NVEnterVT fails with hybrid cards"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62916">bug 62916</a>
              from <span class="vcard"><a class="email" href="mailto:m.b.lankhorst&#64;gmail.com" title="Maarten Lankhorst &lt;m.b.lankhorst&#64;gmail.com&gt;"> <span class="fn">Maarten Lankhorst</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=78590" name="attach_78590" title="[PATCH] hw/xfree86: Allow xf86SetDesiredModes to succeed if no crtc's are enabled.">attachment 78590</a> <a href="attachment.cgi?id=78590&amp;action=edit" title="[PATCH] hw/xfree86: Allow xf86SetDesiredModes to succeed if no crtc's are enabled.">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=62916&amp;attachment=78590'>[review]</a>
[PATCH] hw/xfree86: Allow xf86SetDesiredModes to succeed if no crtc's are
enabled.

I just noticed the same problem with xserver 1.14, x1.13 worked fine. Hopefully
attached patch fixes it for you too.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1367228012.6C1Bef3.4399--

--===============0552539825==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0552539825==--
