From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94637] system crash, no messages, GT215,
 ubuntu 16.04 when running glmark2 for a few minutes.
Date: Sun, 20 Mar 2016 14:14:47 +0000
Message-ID: <bug-94637-8800-1L2umUY9P7@http.bugs.freedesktop.org/>
References: <bug-94637-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0768581913=="
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


--===============0768581913==
Content-Type: multipart/alternative; boundary="14584832871.D5d6.19553";
 charset="UTF-8"


--14584832871.D5d6.19553
Date: Sun, 20 Mar 2016 14:14:47 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94637

--- Comment #4 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
The dmesg you linked is *interesting*. There is no mention of Nouveau being
loaded, and it reports a kernel version of 3.13, whereas your Xorg.log and your
information paste mention kernel 4.4. Could you link a dmesg from 4.4 when it
crashes? (If you have systemd on your laptop, you can get the logs from the
previous boot by running `journalctl -b -1`.)

-- 
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.
--14584832871.D5d6.19553
Date: Sun, 20 Mar 2016 14:14:47 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94637#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - system crash, no messages, GT215, ubuntu 16.04 when running glmark2 for a few minutes."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94637">bug 94637</a>
              from <span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span></b>
        <pre>The dmesg you linked is *interesting*. There is no mention of Nouveau being
loaded, and it reports a kernel version of 3.13, whereas your Xorg.log and your
information paste mention kernel 4.4. Could you link a dmesg from 4.4 when it
crashes? (If you have systemd on your laptop, you can get the logs from the
previous boot by running `journalctl -b -1`.)</pre>
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
--14584832871.D5d6.19553--

--===============0768581913==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0768581913==--
