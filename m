From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93932] Xorg/Nouveau crashes with Segmentation fault
 when setting i7-Skylake iGPU as primary grapics device in BIOS
Date: Wed, 24 Feb 2016 04:36:32 +0000
Message-ID: <bug-93932-8800-lHp0Thg3WW@http.bugs.freedesktop.org/>
References: <bug-93932-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0165330165=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93932-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0165330165==
Content-Type: multipart/alternative; boundary="14562885921.db3D.16411";
 charset="UTF-8"


--14562885921.db3D.16411
Date: Wed, 24 Feb 2016 04:36:32 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=93932

Christopher M. Penalver <christopher.m.penalver-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |INVALID
             Status|NEW                         |RESOLVED

--- Comment #1 from Christopher M. Penalver <christopher.m.penalver-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Matthias, thank you for reporting this and helping make Ubuntu better. However,
your crash report is manually attached.

Please follow these instructions to have apport report a new bug about your
crash that can be dealt with by the automatic retracer. First, execute at a
terminal:
cd /var/crash && sudo rm * ; sudo apt-get update && sudo apt-get -y
dist-upgrade && sudo service apport start force_start=1

If you are running the Ubuntu Stable Release you might need to enable apport in
/etc/default/apport and restart. Now reproduce the crash, then open a terminal,
navigate to your /var/crash directory and file your report with:
sudo ubuntu-bug /var/crash/_my_crash_report.crash

where _my_crash_report.crash is the crash you would like to report. By default,
this sends the crash to the Ubuntu Error Tracker infrastructure, which is
different than Launchpad. For more on this, please see
https://wiki.ubuntu.com/ErrorTracker .  

However, if after doing this you would still like to have a crash report posted
to Launchpad, for example to ease triage and add others to your report, one
would need to open the following file via a terminal:
sudo nano /etc/apport/crashdb.conf

and comment out the line:
'problem_types': ['Bug', 'Package'],

by changing it to:
# 'problem_types': ['Bug', 'Package'],

Save, close, and file the crash report via:
sudo ubuntu-bug /var/crash/FILENAME.crash

Where FILENAME is the actual name of the file found in the folder.

However, this report is being closed since the process outlined above will deal
with this issue more efficiently.

Also, please do not attach your crash report manually to this report and reopen
it.

Thank you for your understanding.

Helpful bug reporting tips:
https://wiki.ubuntu.com/ReportingBugs

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14562885921.db3D.16411
Date: Wed, 24 Feb 2016 04:36:32 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:christopher.m.penalver&#64;gmail.com" title="Christopher M. Penalver &lt;christopher.m.penalver&#64;gmail.com&gt;"> <span class="fn">Christopher M. Penalver</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED INVALID - Xorg/Nouveau crashes with Segmentation fault when setting i7-Skylake iGPU as primary grapics device in BIOS"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93932">bug 93932</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>INVALID
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED INVALID - Xorg/Nouveau crashes with Segmentation fault when setting i7-Skylake iGPU as primary grapics device in BIOS"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93932#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED INVALID - Xorg/Nouveau crashes with Segmentation fault when setting i7-Skylake iGPU as primary grapics device in BIOS"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93932">bug 93932</a>
              from <span class="vcard"><a class="email" href="mailto:christopher.m.penalver&#64;gmail.com" title="Christopher M. Penalver &lt;christopher.m.penalver&#64;gmail.com&gt;"> <span class="fn">Christopher M. Penalver</span></a>
</span></b>
        <pre>Matthias, thank you for reporting this and helping make Ubuntu better. However,
your crash report is manually attached.

Please follow these instructions to have apport report a new bug about your
crash that can be dealt with by the automatic retracer. First, execute at a
terminal:
cd /var/crash &amp;&amp; sudo rm * ; sudo apt-get update &amp;&amp; sudo apt-get -y
dist-upgrade &amp;&amp; sudo service apport start force_start=1

If you are running the Ubuntu Stable Release you might need to enable apport in
/etc/default/apport and restart. Now reproduce the crash, then open a terminal,
navigate to your /var/crash directory and file your report with:
sudo ubuntu-bug /var/crash/_my_crash_report.crash

where _my_crash_report.crash is the crash you would like to report. By default,
this sends the crash to the Ubuntu Error Tracker infrastructure, which is
different than Launchpad. For more on this, please see
<a href="https://wiki.ubuntu.com/ErrorTracker">https://wiki.ubuntu.com/ErrorTracker</a> .  

However, if after doing this you would still like to have a crash report posted
to Launchpad, for example to ease triage and add others to your report, one
would need to open the following file via a terminal:
sudo nano /etc/apport/crashdb.conf

and comment out the line:
'problem_types': ['Bug', 'Package'],

by changing it to:
# 'problem_types': ['Bug', 'Package'],

Save, close, and file the crash report via:
sudo ubuntu-bug /var/crash/FILENAME.crash

Where FILENAME is the actual name of the file found in the folder.

However, this report is being closed since the process outlined above will deal
with this issue more efficiently.

Also, please do not attach your crash report manually to this report and reopen
it.

Thank you for your understanding.

Helpful bug reporting tips:
<a href="https://wiki.ubuntu.com/ReportingBugs">https://wiki.ubuntu.com/ReportingBugs</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14562885921.db3D.16411--

--===============0165330165==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0165330165==--
