From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74002] [un]docking Lenovo W530 results in interrupt
	storm
Date: Fri, 24 Jan 2014 00:06:36 +0000
Message-ID: <bug-74002-8800-uu7xHbZtpR@http.bugs.freedesktop.org/>
References: <bug-74002-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1109250631=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74002-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1109250631==
Content-Type: multipart/alternative; boundary="1390521996.A06e2.2023"; charset="us-ascii"


--1390521996.A06e2.2023
Date: Fri, 24 Jan 2014 00:06:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74002

--- Comment #6 from Jamin Collins <jcollins-u0TlgVUp4POoiH3BShWgcg@public.gmane.org> ---
Should also note that I attempted booting with the nouveau.config=NvI2C=1
kernel parameter.  However, with this parameter present, both the VT text and
splash screen were corrupted (appeared interleaved), there was no display from
X (though I could hear the startup sound indicating it had started), and the
system was not reliably connected to the network (couldn't ping or ssh to it).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390521996.A06e2.2023
Date: Fri, 24 Jan 2014 00:06:36 +0000
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
   title="NEW --- - [un]docking Lenovo W530 results in interrupt storm"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74002#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [un]docking Lenovo W530 results in interrupt storm"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74002">bug 74002</a>
              from <span class="vcard"><a class="email" href="mailto:jcollins&#64;asgardsrealm.net" title="Jamin Collins &lt;jcollins&#64;asgardsrealm.net&gt;"> <span class="fn">Jamin Collins</span></a>
</span></b>
        <pre>Should also note that I attempted booting with the nouveau.config=NvI2C=1
kernel parameter.  However, with this parameter present, both the VT text and
splash screen were corrupted (appeared interleaved), there was no display from
X (though I could hear the startup sound indicating it had started), and the
system was not reliably connected to the network (couldn't ping or ssh to it).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390521996.A06e2.2023--

--===============1109250631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1109250631==--
