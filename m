From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69168] [NVA8]Arbitrary crashes
Date: Tue, 10 Sep 2013 18:31:18 +0000
Message-ID: <bug-69168-8800-E1bVJsxwJ8@http.bugs.freedesktop.org/>
References: <bug-69168-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1433931077=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69168-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1433931077==
Content-Type: multipart/alternative; boundary="1378837878.7c30Da1.24205"; charset="us-ascii"


--1378837878.7c30Da1.24205
Date: Tue, 10 Sep 2013 18:31:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69168

--- Comment #2 from Wompy Dompy <wompy-KK0ffGbhmjU@public.gmane.org> ---
Created attachment 85581
  --> https://bugs.freedesktop.org/attachment.cgi?id=85581&action=edit
latest Xorg-log

Thanks for that quick response.

That one is from the latest crash today. I don't think X restarts though. What
happens is that I can move my mice, but gnome is not reacting any more, but I
can still switch to the tty-consoles. Sometimes the gdm-login appears on tty2
though. Since I heard about a lot of improvements in 3.11 I asked the guys in
#archlinux and they told me I could try to go the "testing" repo, install the
kernel and go back. That's what I did. When it crahes, is there a possiblity to
"restore" the gnome session? I tried to work with gnome-shell --replace
--display :0 but that didn't work.

Kind regards,
wompy

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1378837878.7c30Da1.24205
Date: Tue, 10 Sep 2013 18:31:18 +0000
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
   title="NEW --- - [NVA8]Arbitrary crashes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69168#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA8]Arbitrary crashes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69168">bug 69168</a>
              from <span class="vcard"><a class="email" href="mailto:wompy&#64;gmx.com" title="Wompy Dompy &lt;wompy&#64;gmx.com&gt;"> <span class="fn">Wompy Dompy</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=85581" name="attach_85581" title="latest Xorg-log">attachment 85581</a> <a href="attachment.cgi?id=85581&amp;action=edit" title="latest Xorg-log">[details]</a></span>
latest Xorg-log

Thanks for that quick response.

That one is from the latest crash today. I don't think X restarts though. What
happens is that I can move my mice, but gnome is not reacting any more, but I
can still switch to the tty-consoles. Sometimes the gdm-login appears on tty2
though. Since I heard about a lot of improvements in 3.11 I asked the guys in
#archlinux and they told me I could try to go the &quot;testing&quot; repo, install the
kernel and go back. That's what I did. When it crahes, is there a possiblity to
&quot;restore&quot; the gnome session? I tried to work with gnome-shell --replace
--display :0 but that didn't work.

Kind regards,
wompy</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1378837878.7c30Da1.24205--

--===============1433931077==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1433931077==--
