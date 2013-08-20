From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66255] Xinerama 2x2 monitor configuration display
	issues
Date: Tue, 20 Aug 2013 17:04:51 +0000
Message-ID: <bug-66255-8800-4PFRoDmxdC@http.bugs.freedesktop.org/>
References: <bug-66255-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1089721611=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-66255-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1089721611==
Content-Type: multipart/alternative; boundary="1377018292.AEBB1.4842"; charset="us-ascii"


--1377018292.AEBB1.4842
Date: Tue, 20 Aug 2013 17:04:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=66255

--- Comment #18 from Trev Jackson <trev.g7pvs-XZoyATsUNX5Wk0Htik3J/w@public.gmane.org> ---
Created attachment 84350
  --> https://bugs.freedesktop.org/attachment.cgi?id=84350&action=edit
1.0.9 sliding and seperate top and bottom displays

Using 1.0.9 a segmentation fault no longer occurs, however the driver isn't
performing as expected.
The attached file causes the display on the individual monitors to move
sideways as you move the mouse from one monitor to the next.  In addition the
top two monitors act as one screen and the bottom two as a different screen and
you cannot bridge across them with a program window(e.g a browser).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377018292.AEBB1.4842
Date: Tue, 20 Aug 2013 17:04:52 +0000
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
   title="NEW --- - Xinerama 2x2 monitor configuration display issues"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66255#c18">Comment # 18</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Xinerama 2x2 monitor configuration display issues"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66255">bug 66255</a>
              from <span class="vcard"><a class="email" href="mailto:trev.g7pvs&#64;ntlworld.com" title="Trev Jackson &lt;trev.g7pvs&#64;ntlworld.com&gt;"> <span class="fn">Trev Jackson</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=84350" name="attach_84350" title="1.0.9 sliding and seperate top and bottom displays">attachment 84350</a> <a href="attachment.cgi?id=84350&amp;action=edit" title="1.0.9 sliding and seperate top and bottom displays">[details]</a></span>
1.0.9 sliding and seperate top and bottom displays

Using 1.0.9 a segmentation fault no longer occurs, however the driver isn't
performing as expected.
The attached file causes the display on the individual monitors to move
sideways as you move the mouse from one monitor to the next.  In addition the
top two monitors act as one screen and the bottom two as a different screen and
you cannot bridge across them with a program window(e.g a browser).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377018292.AEBB1.4842--

--===============1089721611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1089721611==--
