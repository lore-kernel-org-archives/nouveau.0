From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93887] [NV96] Amilo Xi 3650: G96M [GeForce 9600M
 GT]: HDMI monitor stays black after s2ram
Date: Tue, 03 May 2016 13:59:58 +0000
Message-ID: <bug-93887-8800-p6rhaMc1fU@http.bugs.freedesktop.org/>
References: <bug-93887-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0408021826=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93887-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0408021826==
Content-Type: multipart/alternative; boundary="14622839982.6eFA48C.29512";
 charset="UTF-8"


--14622839982.6eFA48C.29512
Date: Tue, 3 May 2016 13:59:58 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=93887

--- Comment #20 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
Hmm, there is no mention of Nouveau suspending in the last two logs you linked.
Nor is there any mention of the system powering up again (the last message is
from systemd: "-- The system has now entered the suspend sleep state.".
Since the computer is coming up again when you resume it, could you blindly get
the logs after it resumes? (I assume you ran something like `s2ram; journalctl
-xb > journal-rc6`, with the journalctl being run before resuming (if that is
even possible)?)

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14622839982.6eFA48C.29512
Date: Tue, 3 May 2016 13:59:58 +0000
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
   title="NEW - [NV96] Amilo Xi 3650: G96M [GeForce 9600M GT]: HDMI monitor stays black after s2ram"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93887#c20">Comment # 20</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV96] Amilo Xi 3650: G96M [GeForce 9600M GT]: HDMI monitor stays black after s2ram"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93887">bug 93887</a>
              from <span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span></b>
        <pre>Hmm, there is no mention of Nouveau suspending in the last two logs you linked.
Nor is there any mention of the system powering up again (the last message is
from systemd: &quot;-- The system has now entered the suspend sleep state.&quot;.
Since the computer is coming up again when you resume it, could you blindly get
the logs after it resumes? (I assume you ran something like `s2ram; journalctl
-xb &gt; journal-rc6`, with the journalctl being run before resuming (if that is
even possible)?)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14622839982.6eFA48C.29512--

--===============0408021826==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0408021826==--
