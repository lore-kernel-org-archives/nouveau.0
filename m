From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88946] New: [NVC1] black screen after resuming from
	hibernate
Date: Tue, 03 Feb 2015 17:07:40 +0000
Message-ID: <bug-88946-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1372726137=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============1372726137==
Content-Type: multipart/alternative; boundary="1422983260.FED3c231.23563"; charset="UTF-8"


--1422983260.FED3c231.23563
Date: Tue, 3 Feb 2015 17:07:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=88946

            Bug ID: 88946
           Summary: [NVC1] black screen after resuming from hibernate
           Product: xorg
           Version: 7.7 (2012.06)
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: baumber-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 113124
  --> https://bugs.freedesktop.org/attachment.cgi?id=113124&action=edit
syslog messages standy and resume - working

Hello,

I use Kubuntu 14.04.x together with a nvidia graphics card NVC1 (GF108) GT 430
passive and driver nouveau. 

Standby and resume works with the nouveau driver, but hibernate and resume
don't.

There is a black screen after resume, then the monitor goes off (no signal) and
no keyboard input is possible => Only a hard reset helps.

*** Package versions
Kubuntu 14.04.1 64bit
nouveau version 1.0.11-1-ubuntu2~trusty
Mesa 10.3.2, Xserver 1.16.0 (Utopic (14.10) Xstack)
kernel 3.16.x (also tested kernel 3.18.5 and 3.19rc7)

I have attached the following logs; with kernel parameter nouveau.debug=trace

--- syslog and xorg.log for the working standby 
syslog_standby_resume.txt    
standby_resume_Xorg.0.log.old_working.txt

--- syslog and xorg.log for the (hibernate) and resume problem 
syslog_hibernate_resume_NOT_working.txt
hibernate_resume_Xorg.0.log.old_NOT_working.txt

--- lspci.txt

There is a crash at the xserver;

[   101.332] nouveau_exa_upload_to_screen:380 - falling back to memcpy ignores
tiling
[   101.348] nouveau_exa_download_from_screen:295 - falling back to memcpy
ignores tiling
[   101.348] (EE) 
[   101.348] (EE) Backtrace:
[   101.348] (EE) 0: /usr/bin/X (xorg_backtrace+0x48) [0x7fbef984ae18]
[   101.349] (EE) 1: /usr/bin/X (0x7fbef96a6000+0x1a8e59) [0x7fbef984ee59]
[   101.349] (EE) 2: /lib/x86_64-linux-gnu/libc.so.6 (0x7fbef7826000+0x36d40)
[0x7fbef785cd40]
[   101.349] (EE) 3: /lib/x86_64-linux-gnu/libc.so.6 (0x7fbef7826000+0x98d66)
[0x7fbef78bed66]
[   101.349] (EE) 4: /usr/lib/xorg/modules/libexa.so (0x7fbef334d000+0x5356)
[0x7fbef3352356]
[   101.349] (EE) 5: /usr/lib/xorg/modules/libexa.so (0x7fbef334d000+0x57fb)
[0x7fbef33527fb]
[   101.349] (EE) 6: /usr/lib/xorg/modules/libexa.so (0x7fbef334d000+0x7e22)
[0x7fbef3354e22]
[   101.349] (EE) 7: /usr/lib/xorg/modules/libexa.so (0x7fbef334d000+0x100c2)
[0x7fbef335d0c2]
[   101.349] (EE) 8: /usr/lib/xorg/modules/libexa.so (0x7fbef334d000+0x8499)
[0x7fbef3355499]
[   101.349] (EE) 9: /usr/bin/X (0x7fbef96a6000+0x131af9) [0x7fbef97d7af9]
[   101.349] (EE) 10: /usr/bin/X (0x7fbef96a6000+0x50281) [0x7fbef96f6281]
[   101.349] (EE) 11: /usr/bin/X (0x7fbef96a6000+0x5339e) [0x7fbef96f939e]
[   101.349] (EE) 12: /usr/bin/X (0x7fbef96a6000+0x571ea) [0x7fbef96fd1ea]
[   101.349] (EE) 13: /lib/x86_64-linux-gnu/libc.so.6 (__libc_start_main+0xf5)
[0x7fbef7847ec5]
[   101.349] (EE) 14: /usr/bin/X (0x7fbef96a6000+0x4276e) [0x7fbef96e876e]
[   101.349] (EE) 
[   101.349] (EE) Segmentation fault at address 0x0
[   101.349] (EE) 
Fatal server error:
[   101.349] (EE) Caught signal 11 (Segmentation fault). Server aborting

Thank you for your help!

Best regards, Bernhard

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1422983260.FED3c231.23563
Date: Tue, 3 Feb 2015 17:07:40 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVC1] black screen after resuming from hibernate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88946">88946</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVC1] black screen after resuming from hibernate
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>7.7 (2012.06)
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>baumber&#64;hotmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=113124" name="attach_113124" title="syslog messages standy and resume - working">attachment 113124</a> <a href="attachment.cgi?id=113124&amp;action=edit" title="syslog messages standy and resume - working">[details]</a></span>
syslog messages standy and resume - working

Hello,

I use Kubuntu 14.04.x together with a nvidia graphics card NVC1 (GF108) GT 430
passive and driver nouveau. 

Standby and resume works with the nouveau driver, but hibernate and resume
don't.

There is a black screen after resume, then the monitor goes off (no signal) and
no keyboard input is possible =&gt; Only a hard reset helps.

*** Package versions
Kubuntu 14.04.1 64bit
nouveau version 1.0.11-1-ubuntu2~trusty
Mesa 10.3.2, Xserver 1.16.0 (Utopic (14.10) Xstack)
kernel 3.16.x (also tested kernel 3.18.5 and 3.19rc7)

I have attached the following logs; with kernel parameter nouveau.debug=trace

--- syslog and xorg.log for the working standby 
syslog_standby_resume.txt    
standby_resume_Xorg.0.log.old_working.txt

--- syslog and xorg.log for the (hibernate) and resume problem 
syslog_hibernate_resume_NOT_working.txt
hibernate_resume_Xorg.0.log.old_NOT_working.txt

--- lspci.txt

There is a crash at the xserver;

[   101.332] nouveau_exa_upload_to_screen:380 - falling back to memcpy ignores
tiling
[   101.348] nouveau_exa_download_from_screen:295 - falling back to memcpy
ignores tiling
[   101.348] (EE) 
[   101.348] (EE) Backtrace:
[   101.348] (EE) 0: /usr/bin/X (xorg_backtrace+0x48) [0x7fbef984ae18]
[   101.349] (EE) 1: /usr/bin/X (0x7fbef96a6000+0x1a8e59) [0x7fbef984ee59]
[   101.349] (EE) 2: /lib/x86_64-linux-gnu/libc.so.6 (0x7fbef7826000+0x36d40)
[0x7fbef785cd40]
[   101.349] (EE) 3: /lib/x86_64-linux-gnu/libc.so.6 (0x7fbef7826000+0x98d66)
[0x7fbef78bed66]
[   101.349] (EE) 4: /usr/lib/xorg/modules/libexa.so (0x7fbef334d000+0x5356)
[0x7fbef3352356]
[   101.349] (EE) 5: /usr/lib/xorg/modules/libexa.so (0x7fbef334d000+0x57fb)
[0x7fbef33527fb]
[   101.349] (EE) 6: /usr/lib/xorg/modules/libexa.so (0x7fbef334d000+0x7e22)
[0x7fbef3354e22]
[   101.349] (EE) 7: /usr/lib/xorg/modules/libexa.so (0x7fbef334d000+0x100c2)
[0x7fbef335d0c2]
[   101.349] (EE) 8: /usr/lib/xorg/modules/libexa.so (0x7fbef334d000+0x8499)
[0x7fbef3355499]
[   101.349] (EE) 9: /usr/bin/X (0x7fbef96a6000+0x131af9) [0x7fbef97d7af9]
[   101.349] (EE) 10: /usr/bin/X (0x7fbef96a6000+0x50281) [0x7fbef96f6281]
[   101.349] (EE) 11: /usr/bin/X (0x7fbef96a6000+0x5339e) [0x7fbef96f939e]
[   101.349] (EE) 12: /usr/bin/X (0x7fbef96a6000+0x571ea) [0x7fbef96fd1ea]
[   101.349] (EE) 13: /lib/x86_64-linux-gnu/libc.so.6 (__libc_start_main+0xf5)
[0x7fbef7847ec5]
[   101.349] (EE) 14: /usr/bin/X (0x7fbef96a6000+0x4276e) [0x7fbef96e876e]
[   101.349] (EE) 
[   101.349] (EE) Segmentation fault at address 0x0
[   101.349] (EE) 
Fatal server error:
[   101.349] (EE) Caught signal 11 (Segmentation fault). Server aborting

Thank you for your help!

Best regards, Bernhard</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1422983260.FED3c231.23563--

--===============1372726137==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1372726137==--
