From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54646] [NVD9] i2c failure on Quadro NVS 4200M (GF119)
Date: Sat, 24 Aug 2013 13:25:37 +0000
Message-ID: <bug-54646-8800-uiBAyPq3Y9@http.bugs.freedesktop.org/>
References: <bug-54646-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0051367215=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54646-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0051367215==
Content-Type: multipart/alternative; boundary="1377350737.Ff3ed1.28860"; charset="us-ascii"


--1377350737.Ff3ed1.28860
Date: Sat, 24 Aug 2013 13:25:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=54646

--- Comment #2 from Jan Vesely <jano.vesely-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #1)
> There have been a lot of fixes to NVD0+ since you filed this bug. Could you
> try 3.11-rc6 (or nouveau/master)? If it still shows issues, please supply a
> complete dmesg as well as your vbios (/sys/kernel/debug/dri/0/vbios.rom).

I almost forgot about this bug. I use novueau kernel daily (with Airlie's
auto-off patches) and the dmesg output looks OK with the recent version
(3.11-rc6+).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377350737.Ff3ed1.28860
Date: Sat, 24 Aug 2013 13:25:37 +0000
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
   title="NEW --- - [NVD9] i2c failure on Quadro NVS 4200M (GF119)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54646#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVD9] i2c failure on Quadro NVS 4200M (GF119)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54646">bug 54646</a>
              from <span class="vcard"><a class="email" href="mailto:jano.vesely&#64;gmail.com" title="Jan Vesely &lt;jano.vesely&#64;gmail.com&gt;"> <span class="fn">Jan Vesely</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=54646#c1">comment #1</a>)
<span class="quote">&gt; There have been a lot of fixes to NVD0+ since you filed this bug. Could you
&gt; try 3.11-rc6 (or nouveau/master)? If it still shows issues, please supply a
&gt; complete dmesg as well as your vbios (/sys/kernel/debug/dri/0/vbios.rom).</span >

I almost forgot about this bug. I use novueau kernel daily (with Airlie's
auto-off patches) and the dmesg output looks OK with the recent version
(3.11-rc6+).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377350737.Ff3ed1.28860--

--===============0051367215==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0051367215==--
