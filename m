From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74002] [NVE7] [un]docking Lenovo W530 results in
 interrupt storm
Date: Fri, 24 Jan 2014 03:44:14 +0000
Message-ID: <bug-74002-8800-3z2D4HlXIB@http.bugs.freedesktop.org/>
References: <bug-74002-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2054478698=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74002-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2054478698==
Content-Type: multipart/alternative; boundary="1390535054.C81C8F82.14505"; charset="us-ascii"


--1390535054.C81C8F82.14505
Date: Fri, 24 Jan 2014 03:44:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74002

--- Comment #7 from Jamin Collins <jcollins-u0TlgVUp4POoiH3BShWgcg@public.gmane.org> ---
Created attachment 92709
  --> https://bugs.freedesktop.org/attachment.cgi?id=92709&action=edit
dmesg output with debugging enabled

Reproduced the storm with a few additional kernel command line options to
increase logging verbosity.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390535054.C81C8F82.14505
Date: Fri, 24 Jan 2014 03:44:14 +0000
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
   title="NEW --- - [NVE7] [un]docking Lenovo W530 results in interrupt storm"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74002#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] [un]docking Lenovo W530 results in interrupt storm"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74002">bug 74002</a>
              from <span class="vcard"><a class="email" href="mailto:jcollins&#64;asgardsrealm.net" title="Jamin Collins &lt;jcollins&#64;asgardsrealm.net&gt;"> <span class="fn">Jamin Collins</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=92709" name="attach_92709" title="dmesg output with debugging enabled">attachment 92709</a> <a href="attachment.cgi?id=92709&amp;action=edit" title="dmesg output with debugging enabled">[details]</a></span>
dmesg output with debugging enabled

Reproduced the storm with a few additional kernel command line options to
increase logging verbosity.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390535054.C81C8F82.14505--

--===============2054478698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2054478698==--
