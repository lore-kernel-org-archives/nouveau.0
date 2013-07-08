From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54700] Distorted graphics (double cursor) with
 GeForce 4200Go (NV28)
Date: Mon, 08 Jul 2013 09:14:50 +0000
Message-ID: <bug-54700-8800-ycXM7Phulb@http.bugs.freedesktop.org/>
References: <bug-54700-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0618440139=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54700-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0618440139==
Content-Type: multipart/alternative; boundary="1373274890.0eb041.19350"; charset="us-ascii"


--1373274890.0eb041.19350
Date: Mon, 8 Jul 2013 09:14:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=54700

--- Comment #22 from r.ductor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
(In reply to comment #20)
> (In reply to comment #14)
> > (In reply to comment #12)

> > > * Does the "distorted graphics" differ if you (re)move the mesa driver
> > > nouveau_vieux.so ?
> > 
> > YES, just reproduced after
> >   mv /usr/lib/i386-linux-gnu/dri/{,__unloaded__}nouveau_vieux_dri.so
> >  
> Did you restart X after doing that ?

Yes, I've rebooted after the move.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1373274890.0eb041.19350
Date: Mon, 8 Jul 2013 09:14:50 +0000
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
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700#c22">Comment # 22</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700">bug 54700</a>
              from <span class="vcard"><a class="email" href="mailto:r.ductor&#64;gmail.com" title="r.ductor&#64;gmail.com">r.ductor&#64;gmail.com</a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=54700#c20">comment #20</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=54700#c14">comment #14</a>)
&gt; &gt; (In reply to <a href="show_bug.cgi?id=54700#c12">comment #12</a>)</span >

<span class="quote">&gt; &gt; &gt; * Does the &quot;distorted graphics&quot; differ if you (re)move the mesa driver
&gt; &gt; &gt; nouveau_vieux.so ?
&gt; &gt; 
&gt; &gt; YES, just reproduced after
&gt; &gt;   mv /usr/lib/i386-linux-gnu/dri/{,__unloaded__}nouveau_vieux_dri.so
&gt; &gt;  
&gt; Did you restart X after doing that ?</span >

Yes, I've rebooted after the move.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1373274890.0eb041.19350--

--===============0618440139==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0618440139==--
