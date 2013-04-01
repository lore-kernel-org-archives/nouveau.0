From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61537] Screen flicker when using display with
	incorrect EDID
Date: Mon, 01 Apr 2013 17:07:01 +0000
Message-ID: <bug-61537-8800-8SK8ODsAs8@http.bugs.freedesktop.org/>
References: <bug-61537-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1681730651=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-61537-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1681730651==
Content-Type: multipart/alternative; boundary="1364836021.2544A6c2.23528"; charset="us-ascii"


--1364836021.2544A6c2.23528
Date: Mon, 1 Apr 2013 17:07:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61537

--- Comment #1 from Jan Hebler <jhebler-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Same Problem here. You can use the following work-around
1. mkdir [KERNEL-FIRMWARE-DIRECTORY]/edid
2. cp [MONITOR-EDID-FILE].bin [KERNEL-FIRMWARE-DIRECTORY]/edid
3. add the following to your Kernel Commandline:

drm_kms_helper.edid_firmware=edid/[MONITOR-EDID-FILE].bin

This will provide kms and Friends with correct EDID-Informations. However
to stop the annoying flicker, you have to 
4. add another Statement to your Kernel Commandline:

drm_kms_helper.poll=0

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1364836021.2544A6c2.23528
Date: Mon, 1 Apr 2013 17:07:01 +0000
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
   title="NEW --- - Screen flicker when using display with incorrect EDID"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61537#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Screen flicker when using display with incorrect EDID"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61537">bug 61537</a>
              from <span class="vcard"><a class="email" href="mailto:jhebler&#64;gmail.com" title="Jan Hebler &lt;jhebler&#64;gmail.com&gt;"> <span class="fn">Jan Hebler</span></a>
</span></b>
        <pre>Same Problem here. You can use the following work-around
1. mkdir [KERNEL-FIRMWARE-DIRECTORY]/edid
2. cp [MONITOR-EDID-FILE].bin [KERNEL-FIRMWARE-DIRECTORY]/edid
3. add the following to your Kernel Commandline:

drm_kms_helper.edid_firmware=edid/[MONITOR-EDID-FILE].bin

This will provide kms and Friends with correct EDID-Informations. However
to stop the annoying flicker, you have to 
4. add another Statement to your Kernel Commandline:

drm_kms_helper.poll=0</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1364836021.2544A6c2.23528--

--===============1681730651==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1681730651==--
