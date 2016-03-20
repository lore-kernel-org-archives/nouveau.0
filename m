From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94637] system crash, no messages, GT215,
 ubuntu 16.04 when running glmark2 for a few minutes.
Date: Sun, 20 Mar 2016 17:36:41 +0000
Message-ID: <bug-94637-8800-lKsOfbUGum@http.bugs.freedesktop.org/>
References: <bug-94637-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0187854266=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94637-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0187854266==
Content-Type: multipart/alternative; boundary="14584954000.8fB5.10393";
 charset="UTF-8"


--14584954000.8fB5.10393
Date: Sun, 20 Mar 2016 17:36:40 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94637

--- Comment #11 from Peter Silva <peter-UmW4lSGjmaZq3vnQzO7mXA@public.gmane.org> ---

added the netlog thing.  It emitted this single line when it crashed:

peter@tigaroo:~$ more nc_log
[ 5612.909828] nouveau 0000:01:00.0: disp: ERROR 0 [] 00 [] chid 1 mthd 0080
data 00000000
peter@tigaroo:~$

-- 
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.
--14584954000.8fB5.10393
Date: Sun, 20 Mar 2016 17:36:40 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - system crash, no messages, GT215, ubuntu 16.04 when running glmark2 for a few minutes."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94637#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - system crash, no messages, GT215, ubuntu 16.04 when running glmark2 for a few minutes."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94637">bug 94637</a>
              from <span class="vcard"><a class="email" href="mailto:peter&#64;bsqt.homeip.net" title="Peter Silva &lt;peter&#64;bsqt.homeip.net&gt;"> <span class="fn">Peter Silva</span></a>
</span></b>
        <pre>
added the netlog thing.  It emitted this single line when it crashed:

peter&#64;tigaroo:~$ more nc_log
[ 5612.909828] nouveau 0000:01:00.0: disp: ERROR 0 [] 00 [] chid 1 mthd 0080
data 00000000
peter&#64;tigaroo:~$</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>
--14584954000.8fB5.10393--

--===============0187854266==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0187854266==--
