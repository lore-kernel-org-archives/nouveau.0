From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59474] fedora 18 X fatal server error no screens
 found after boot
Date: Tue, 12 Feb 2013 20:48:24 +0000
Message-ID: <bug-59474-8800-rCUxVnJdTU@http.bugs.freedesktop.org/>
References: <bug-59474-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1174326014=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59474-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1174326014==
Content-Type: multipart/alternative; boundary="1360702103.E6ae1.10251"; charset="us-ascii"


--1360702103.E6ae1.10251
Date: Tue, 12 Feb 2013 20:48:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59474

raven <radim.venglor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |radim.venglor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #9 from raven <radim.venglor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I faced similar error like this one:
xf86OpenConsole: VT_ACTIVATE failed: No such device or address
when I tried use my NVidia after uprade from Fedora 16 -> 17.

And found resolution for me.

At first I would like mention that my notebook has Optimus and I had configured
bumblebeed with bbswitch for NVidia (nVidia Corporation GF108 [Quadro 1000M]) 
usage.

As resolution for me works:
1. reinstall bumblebee and bbswitch.
2. then I set nouveau driver load conditions (as described for bbswitch)

modprobe bbswitch load_state=0 unload_state=1

3. Reboot


I hope this post can be helpfull.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1360702103.E6ae1.10251
Date: Tue, 12 Feb 2013 20:48:23 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:radim.venglor&#64;gmail.com" title="raven &lt;radim.venglor&#64;gmail.com&gt;"> <span class="fn">raven</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - fedora 18 X fatal server error no screens found after boot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59474">bug 59474</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>radim.venglor&#64;gmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - fedora 18 X fatal server error no screens found after boot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59474#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - fedora 18 X fatal server error no screens found after boot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59474">bug 59474</a>
              from <span class="vcard"><a class="email" href="mailto:radim.venglor&#64;gmail.com" title="raven &lt;radim.venglor&#64;gmail.com&gt;"> <span class="fn">raven</span></a>
</span></b>
        <pre>I faced similar error like this one:
xf86OpenConsole: VT_ACTIVATE failed: No such device or address
when I tried use my NVidia after uprade from Fedora 16 -&gt; 17.

And found resolution for me.

At first I would like mention that my notebook has Optimus and I had configured
bumblebeed with bbswitch for NVidia (nVidia Corporation GF108 [Quadro 1000M]) 
usage.

As resolution for me works:
1. reinstall bumblebee and bbswitch.
2. then I set nouveau driver load conditions (as described for bbswitch)

modprobe bbswitch load_state=0 unload_state=1

3. Reboot


I hope this post can be helpfull.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1360702103.E6ae1.10251--

--===============1174326014==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1174326014==--
