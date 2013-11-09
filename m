From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69488] GF108 (NVC1) GPU lockup
Date: Sat, 09 Nov 2013 23:30:34 +0000
Message-ID: <bug-69488-8800-buDqEpFBkx@http.bugs.freedesktop.org/>
References: <bug-69488-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0304285787=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69488-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0304285787==
Content-Type: multipart/alternative; boundary="1384039834.40F6d282.1105"; charset="us-ascii"


--1384039834.40F6d282.1105
Date: Sat, 9 Nov 2013 23:30:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69488

--- Comment #27 from Jean-Louis Dupond <jean-louis-h84OYfGOAs2zQB+pC5nmwQ@public.gmane.org> ---
Created attachment 88952
  --> https://bugs.freedesktop.org/attachment.cgi?id=88952&action=edit
Dmesg 3.12 drm-next

I had no problems with booting anymore after using new kernel 3.12 with
drm-next patches (until commit 91915260ea5ed9d9b19bfb75d53c989c8ada2ab0).

Now I still had some issues that my card didn't shutdown automaticly when
lightdm/gnome-shell was running.

Anyway I decided to upgrade to Ubuntu 14.04 (Trusty).
It didn't work as expected, and the bug came back it seems :(

Attached is a dmesg taken with netconsole. As you can see it prints
[   49.498006] nouveau 0000:01:00.0: Refused to change power state, currently
in D3
When lightdm is starting up.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1384039834.40F6d282.1105
Date: Sat, 9 Nov 2013 23:30:34 +0000
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
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - GF108 (NVC1) GPU lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69488#c27">Comment # 27</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - GF108 (NVC1) GPU lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69488">bug 69488</a>
              from <span class="vcard"><a class="email" href="mailto:jean-louis&#64;dupond.be" title="Jean-Louis Dupond &lt;jean-louis&#64;dupond.be&gt;"> <span class="fn">Jean-Louis Dupond</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=88952" name="attach_88952" title="Dmesg 3.12 drm-next">attachment 88952</a> <a href="attachment.cgi?id=88952&amp;action=edit" title="Dmesg 3.12 drm-next">[details]</a></span>
Dmesg 3.12 drm-next

I had no problems with booting anymore after using new kernel 3.12 with
drm-next patches (until commit 91915260ea5ed9d9b19bfb75d53c989c8ada2ab0).

Now I still had some issues that my card didn't shutdown automaticly when
lightdm/gnome-shell was running.

Anyway I decided to upgrade to Ubuntu 14.04 (Trusty).
It didn't work as expected, and the bug came back it seems :(

Attached is a dmesg taken with netconsole. As you can see it prints
[   49.498006] nouveau 0000:01:00.0: Refused to change power state, currently
in D3
When lightdm is starting up.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1384039834.40F6d282.1105--

--===============0304285787==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0304285787==--
