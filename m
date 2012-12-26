From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58735] GeForce 680, currently driver works on two,
 but not three monitors
Date: Wed, 26 Dec 2012 04:39:08 +0000
Message-ID: <bug-58735-8800-dXapY811Jy@http.bugs.freedesktop.org/>
References: <bug-58735-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0990386322=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58735-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0990386322==
Content-Type: multipart/alternative; boundary="1356496748.275ba1.13695"; charset="us-ascii"


--1356496748.275ba1.13695
Date: Wed, 26 Dec 2012 04:39:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58735

--- Comment #4 from Sean Santos <quantheory-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Well, turns out that my guesses about the problem were totally wrong. The
monitor works fine with the HDMI to DVI conversion, as long as there's no more
than one other monitor present. If I have *both* DVI monitors plugged in, the
HDMI monitor is confused. So this seems to be a problem with a setup with >2
monitors.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1356496748.275ba1.13695
Date: Wed, 26 Dec 2012 04:39:08 +0000
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
   title="NEW --- - GeForce 680, currently driver works on two, but not three monitors"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58735#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - GeForce 680, currently driver works on two, but not three monitors"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58735">bug 58735</a>
              from <span class="vcard"><a class="email" href="mailto:quantheory&#64;gmail.com" title="Sean Santos &lt;quantheory&#64;gmail.com&gt;"> <span class="fn">Sean Santos</span></a>
</span></b>
        <pre>Well, turns out that my guesses about the problem were totally wrong. The
monitor works fine with the HDMI to DVI conversion, as long as there's no more
than one other monitor present. If I have *both* DVI monitors plugged in, the
HDMI monitor is confused. So this seems to be a problem with a setup with &gt;2
monitors.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1356496748.275ba1.13695--

--===============0990386322==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0990386322==--
