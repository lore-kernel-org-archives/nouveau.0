From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56601] 9600m GT HDMI output no video or audio.
Date: Sat, 24 Aug 2013 23:19:39 +0000
Message-ID: <bug-56601-8800-SAqlxKW0Nk@http.bugs.freedesktop.org/>
References: <bug-56601-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0302196363=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-56601-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0302196363==
Content-Type: multipart/alternative; boundary="1377386379.EbDAC4f2.8556"; charset="us-ascii"


--1377386379.EbDAC4f2.8556
Date: Sat, 24 Aug 2013 23:19:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56601

--- Comment #8 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Please re-test with the latest kernel. There was a display rework in 3.8 that
should have helped things like HDMI. There were subsequent fixes to hdmi audio,
and indications are that it should be working in 3.11-rc6 on most cards.

If you're still having trouble on 3.11-rc6, please supply a dmesg output from
it along with your vbios (/sys/kernel/debug/dri/0/vbios.rom).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377386379.EbDAC4f2.8556
Date: Sat, 24 Aug 2013 23:19:39 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - 9600m GT HDMI output no video or audio."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56601#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - 9600m GT HDMI output no video or audio."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56601">bug 56601</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Please re-test with the latest kernel. There was a display rework in 3.8 that
should have helped things like HDMI. There were subsequent fixes to hdmi audio,
and indications are that it should be working in 3.11-rc6 on most cards.

If you're still having trouble on 3.11-rc6, please supply a dmesg output from
it along with your vbios (/sys/kernel/debug/dri/0/vbios.rom).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377386379.EbDAC4f2.8556--

--===============0302196363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0302196363==--
