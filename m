From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74164] [NV04] Native monitor resolution missing
Date: Wed, 29 Jan 2014 08:29:19 +0000
Message-ID: <bug-74164-8800-DigChBefmG@http.bugs.freedesktop.org/>
References: <bug-74164-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0757084012=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74164-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0757084012==
Content-Type: multipart/alternative; boundary="1390984159.DD8AB1.1137"; charset="us-ascii"


--1390984159.DD8AB1.1137
Date: Wed, 29 Jan 2014 08:29:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74164

--- Comment #9 from Mauro Molinari <mauromol-IWqWACnzNjyonA0d6jMUrA@public.gmane.org> ---
Please note I'm using a KVM switch, I don't know if this can make any
difference.

Also, I have another glitch. I set the following in the screensaver settings of
Fedora (I'm using the LXDE edition):
- screen saver disabled
- display power management enabled
  - standby after 2 minutes
  - suspend after 3 minutes
  - off after 5 minutes
However, the monitor never goes to sleep or off, in any way, even if I leave it
on for, say, 10 minutes.
The best I can do is to turn on the screen saver and set it so that the monitor
is blanked after x minutes, however it stays on (I can see that looking at the
monitor led on its frame - green if on, orange if sleeping, off if off).

Is this yet another problem? Or might it be related to this one?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390984159.DD8AB1.1137
Date: Wed, 29 Jan 2014 08:29:19 +0000
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
   title="NEW --- - [NV04] Native monitor resolution missing"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74164#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV04] Native monitor resolution missing"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74164">bug 74164</a>
              from <span class="vcard"><a class="email" href="mailto:mauromol&#64;tiscali.it" title="Mauro Molinari &lt;mauromol&#64;tiscali.it&gt;"> <span class="fn">Mauro Molinari</span></a>
</span></b>
        <pre>Please note I'm using a KVM switch, I don't know if this can make any
difference.

Also, I have another glitch. I set the following in the screensaver settings of
Fedora (I'm using the LXDE edition):
- screen saver disabled
- display power management enabled
  - standby after 2 minutes
  - suspend after 3 minutes
  - off after 5 minutes
However, the monitor never goes to sleep or off, in any way, even if I leave it
on for, say, 10 minutes.
The best I can do is to turn on the screen saver and set it so that the monitor
is blanked after x minutes, however it stays on (I can see that looking at the
monitor led on its frame - green if on, orange if sleeping, off if off).

Is this yet another problem? Or might it be related to this one?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390984159.DD8AB1.1137--

--===============0757084012==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0757084012==--
