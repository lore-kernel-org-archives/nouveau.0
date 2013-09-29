From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69928] [NVAA] Boot of linux kernel 3.12-rc2 hangs
Date: Sun, 29 Sep 2013 19:27:20 +0000
Message-ID: <bug-69928-8800-SbabcwJPAo@http.bugs.freedesktop.org/>
References: <bug-69928-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1517155525=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69928-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1517155525==
Content-Type: multipart/alternative; boundary="1380482840.8f57711.19387"; charset="us-ascii"


--1380482840.8f57711.19387
Date: Sun, 29 Sep 2013 19:27:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69928

--- Comment #3 from dirkneukirchen-S0/GAf8tV78@public.gmane.org ---
Created attachment 86806
  --> https://bugs.freedesktop.org/attachment.cgi?id=86806&action=edit
dmesg 3.12-rc2 boots successful with nouveau.config=NvMSI=0

> note the timestamps
I noticed but that was my 1st usage of netconsole - maybe it was some issue
with target system (a VM), router or something else.

> You should be able to toggle MSI off using "nouveau.config=NvMSI=0" appended to > your kernel command line. Can you give it a try and attach the resulting dmesg

see new attachment

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1380482840.8f57711.19387
Date: Sun, 29 Sep 2013 19:27:20 +0000
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
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [NVAA] Boot of linux kernel 3.12-rc2 hangs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69928#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [NVAA] Boot of linux kernel 3.12-rc2 hangs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69928">bug 69928</a>
              from <span class="vcard"><a class="email" href="mailto:dirkneukirchen&#64;web.de" title="dirkneukirchen&#64;web.de">dirkneukirchen&#64;web.de</a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=86806" name="attach_86806" title="dmesg 3.12-rc2 boots successful with nouveau.config=NvMSI=0">attachment 86806</a> <a href="attachment.cgi?id=86806&amp;action=edit" title="dmesg 3.12-rc2 boots successful with nouveau.config=NvMSI=0">[details]</a></span>
dmesg 3.12-rc2 boots successful with nouveau.config=NvMSI=0

<span class="quote">&gt; note the timestamps</span >
I noticed but that was my 1st usage of netconsole - maybe it was some issue
with target system (a VM), router or something else.

<span class="quote">&gt; You should be able to toggle MSI off using &quot;nouveau.config=NvMSI=0&quot; appended to &gt; your kernel command line. Can you give it a try and attach the resulting dmesg</span >

see new attachment</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1380482840.8f57711.19387--

--===============1517155525==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1517155525==--
