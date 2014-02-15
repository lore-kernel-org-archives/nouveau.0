From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74613] [NV34] [v3.14-rc1] nouveau: get 0x10000000
 put 0x0000ed30 state 0xc0000000 (err: MEM_FAULT) push 0x00000000
Date: Sat, 15 Feb 2014 10:41:37 +0000
Message-ID: <bug-74613-8800-mlKPN33ArY@http.bugs.freedesktop.org/>
References: <bug-74613-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1017002044=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74613-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1017002044==
Content-Type: multipart/alternative; boundary="1392460897.AbfEdAED2.10877"; charset="us-ascii"


--1392460897.AbfEdAED2.10877
Date: Sat, 15 Feb 2014 10:41:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74613

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|[v3.14-rc1] [nv34] nouveau: |[NV34] [v3.14-rc1] nouveau:
                   |get 0x10000000 put          |get 0x10000000 put
                   |0x0000ed30 state 0xc0000000 |0x0000ed30 state 0xc0000000
                   |(err: MEM_FAULT) push       |(err: MEM_FAULT) push
                   |0x00000000                  |0x00000000

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #1)
> Btw, is http://cgit.freedesktop.org/nouveau/linux-2.6 not used anymore?

It is... e.g. look at the drm-nouveau-next branch. I don't think the 'master'
branch is really maintained anymore, this is happening in
http://cgit.freedesktop.org/~darktama/nouveau/ which you may also be able to
use to bisect without the rest of the kernel, if your range is sufficiently
small. (Although that repo is a little different...)

> 
> I kind of liked it. Makes bisecting easier on aged machines. And it allows
> to test new patches more easily.
> 
> Now it's all hidden between a huge changeset between v3.13 final and
> v3.14-rc1. And sometimes even spread out over several periods in time
> causing full rebuilds.

I'm confused by what you're trying to say here. v3.14-rc1 and v3.13 are all
available in linus's repo. Use that to bisect....

git bisect start v3.14-rc1 v3.13 -- drivers/gpu/drm/nouveau

That should only look at changes in nouveau between those 2 revs...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392460897.AbfEdAED2.10877
Date: Sat, 15 Feb 2014 10:41:37 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV34] [v3.14-rc1] nouveau: get 0x10000000 put 0x0000ed30 state 0xc0000000 (err: MEM_FAULT) push 0x00000000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74613">bug 74613</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>[v3.14-rc1] [nv34] nouveau: get 0x10000000 put 0x0000ed30 state 0xc0000000 (err: MEM_FAULT) push 0x00000000
           </td>
           <td>[NV34] [v3.14-rc1] nouveau: get 0x10000000 put 0x0000ed30 state 0xc0000000 (err: MEM_FAULT) push 0x00000000
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV34] [v3.14-rc1] nouveau: get 0x10000000 put 0x0000ed30 state 0xc0000000 (err: MEM_FAULT) push 0x00000000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74613#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV34] [v3.14-rc1] nouveau: get 0x10000000 put 0x0000ed30 state 0xc0000000 (err: MEM_FAULT) push 0x00000000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74613">bug 74613</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=74613#c1">comment #1</a>)
<span class="quote">&gt; Btw, is <a href="http://cgit.freedesktop.org/nouveau/linux-2.6">http://cgit.freedesktop.org/nouveau/linux-2.6</a> not used anymore?</span >

It is... e.g. look at the drm-nouveau-next branch. I don't think the 'master'
branch is really maintained anymore, this is happening in
<a href="http://cgit.freedesktop.org/~darktama/nouveau/">http://cgit.freedesktop.org/~darktama/nouveau/</a> which you may also be able to
use to bisect without the rest of the kernel, if your range is sufficiently
small. (Although that repo is a little different...)

<span class="quote">&gt; 
&gt; I kind of liked it. Makes bisecting easier on aged machines. And it allows
&gt; to test new patches more easily.
&gt; 
&gt; Now it's all hidden between a huge changeset between v3.13 final and
&gt; v3.14-rc1. And sometimes even spread out over several periods in time
&gt; causing full rebuilds.</span >

I'm confused by what you're trying to say here. v3.14-rc1 and v3.13 are all
available in linus's repo. Use that to bisect....

git bisect start v3.14-rc1 v3.13 -- drivers/gpu/drm/nouveau

That should only look at changes in nouveau between those 2 revs...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392460897.AbfEdAED2.10877--

--===============1017002044==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1017002044==--
