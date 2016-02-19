From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56615] [NVD9] Unable to start X on ThinkPad T420s
	laptop
Date: Fri, 19 Feb 2016 00:04:36 +0000
Message-ID: <bug-56615-8800-KErKSdhh0K@http.bugs.freedesktop.org/>
References: <bug-56615-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1011483771=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-56615-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1011483771==
Content-Type: multipart/alternative; boundary="14558402760.6aFF.9754";
 charset="UTF-8"


--14558402760.6aFF.9754
Date: Fri, 19 Feb 2016 00:04:36 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=56615

--- Comment #36 from Stefan <ste.lendl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Debian updated to linux 4.3 now and I decided to try nouveau again.

The problem comes from having three displays attached when the graphics card
can only drive two! (one being a projector I don't always use)

When I boot the error shows up, when I then unplug one of the screens,
immediately  the login (gdm3) shows up.

Is it possible to ignore a display on startup but allowing it to be turned on,
reconfigured afterwards?
or defining a set of displays be considered at startup?

Thank you.
Stefan

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14558402760.6aFF.9754
Date: Fri, 19 Feb 2016 00:04:36 +0000
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
   title="NEW - [NVD9] Unable to start X on ThinkPad T420s laptop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56615#c36">Comment # 36</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVD9] Unable to start X on ThinkPad T420s laptop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56615">bug 56615</a>
              from <span class="vcard"><a class="email" href="mailto:ste.lendl&#64;gmail.com" title="Stefan &lt;ste.lendl&#64;gmail.com&gt;"> <span class="fn">Stefan</span></a>
</span></b>
        <pre>Debian updated to linux 4.3 now and I decided to try nouveau again.

The problem comes from having three displays attached when the graphics card
can only drive two! (one being a projector I don't always use)

When I boot the error shows up, when I then unplug one of the screens,
immediately  the login (gdm3) shows up.

Is it possible to ignore a display on startup but allowing it to be turned on,
reconfigured afterwards?
or defining a set of displays be considered at startup?

Thank you.
Stefan</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14558402760.6aFF.9754--

--===============1011483771==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1011483771==--
