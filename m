From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27501] MacBook Pro 5, x unable to boot [NV96 + NVAC]
Date: Fri, 03 Oct 2014 23:26:56 +0000
Message-ID: <bug-27501-8800-YsizwyKyzs@http.bugs.freedesktop.org/>
References: <bug-27501-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2087233745=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-27501-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============2087233745==
Content-Type: multipart/alternative; boundary="1412378816.24bFB326.10077"; charset="UTF-8"


--1412378816.24bFB326.10077
Date: Fri, 3 Oct 2014 23:26:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=27501

--- Comment #46 from thomas <gurutonic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to thomas from comment #45)
> (In reply to Pierre Moreau from comment #44)
> > When using the 9600M GT without acceleration, do you have screen corruption
> > in VT each time? If so, could you try to modify the patch a bit, like:
> > - removing the write to 0x100c1c;
> > - if removing the write doesn't work, changing the offset applied to
> > priv->r100c08 maybe testing all 4-multiples should do it, from 0 to 28.
> 
> I've only tested the 9600 about 10 times, but I've always had corruption. I
> will try your changes and see if it makes a difference.

No change, unfortunately. I first removed the write, then tried each of the
offsets.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1412378816.24bFB326.10077
Date: Fri, 3 Oct 2014 23:26:56 +0000
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
   title="NEW - MacBook Pro 5,x unable to boot [NV96 + NVAC]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=27501#c46">Comment # 46</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - MacBook Pro 5,x unable to boot [NV96 + NVAC]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=27501">bug 27501</a>
              from <span class="vcard"><a class="email" href="mailto:gurutonic&#64;gmail.com" title="thomas &lt;gurutonic&#64;gmail.com&gt;"> <span class="fn">thomas</span></a>
</span></b>
        <pre>(In reply to thomas from <a href="show_bug.cgi?id=27501#c45">comment #45</a>)
<span class="quote">&gt; (In reply to Pierre Moreau from <a href="show_bug.cgi?id=27501#c44">comment #44</a>)
&gt; &gt; When using the 9600M GT without acceleration, do you have screen corruption
&gt; &gt; in VT each time? If so, could you try to modify the patch a bit, like:
&gt; &gt; - removing the write to 0x100c1c;
&gt; &gt; - if removing the write doesn't work, changing the offset applied to
&gt; &gt; priv-&gt;r100c08 maybe testing all 4-multiples should do it, from 0 to 28.
&gt; 
&gt; I've only tested the 9600 about 10 times, but I've always had corruption. I
&gt; will try your changes and see if it makes a difference.</span >

No change, unfortunately. I first removed the write, then tried each of the
offsets.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1412378816.24bFB326.10077--

--===============2087233745==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2087233745==--
