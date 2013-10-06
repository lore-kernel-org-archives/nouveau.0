From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70135] [nv34 PowerMac G5] gnome-shell random crashes
 and rendering issues
Date: Sun, 06 Oct 2013 01:20:09 +0000
Message-ID: <bug-70135-8800-xI852Ql6wa@http.bugs.freedesktop.org/>
References: <bug-70135-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2118323964=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70135-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2118323964==
Content-Type: multipart/alternative; boundary="1381022409.DD0eB1.2076"; charset="us-ascii"


--1381022409.DD0eB1.2076
Date: Sun, 6 Oct 2013 01:20:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70135

--- Comment #8 from John Paul Adrian Glaubitz <glaubitz-1Olz3AKvcsuAKZTfuerNgRvVK+yQ3ZXh@public.gmane.org> ---
Alright, I'll try that.

Although the PowerMac is in a different office and currently MacOS X, I still
have the hard disk with Debian lying on my desk and I can simply pop it back in
and upgrade the packages.

We currently have mesa 9.2.0 in the experimental repositories, so I'll give it
a shot with that first, then upgrade to 9.2.1 from source and report back.

If gnome-shell still crashes, I'll get a gdb backtrace and post it here.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381022409.DD0eB1.2076
Date: Sun, 6 Oct 2013 01:20:09 +0000
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
   title="NEW --- - [nv34 PowerMac G5] gnome-shell random crashes and rendering issues"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70135#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nv34 PowerMac G5] gnome-shell random crashes and rendering issues"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70135">bug 70135</a>
              from <span class="vcard"><a class="email" href="mailto:glaubitz&#64;physik.fu-berlin.de" title="John Paul Adrian Glaubitz &lt;glaubitz&#64;physik.fu-berlin.de&gt;"> <span class="fn">John Paul Adrian Glaubitz</span></a>
</span></b>
        <pre>Alright, I'll try that.

Although the PowerMac is in a different office and currently MacOS X, I still
have the hard disk with Debian lying on my desk and I can simply pop it back in
and upgrade the packages.

We currently have mesa 9.2.0 in the experimental repositories, so I'll give it
a shot with that first, then upgrade to 9.2.1 from source and report back.

If gnome-shell still crashes, I'll get a gdb backtrace and post it here.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381022409.DD0eB1.2076--

--===============2118323964==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2118323964==--
