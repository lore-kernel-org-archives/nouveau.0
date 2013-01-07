From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23223] [NV4B] nVidia Geforce 7300 fails to properly
	resume
Date: Mon, 07 Jan 2013 19:42:53 +0000
Message-ID: <bug-23223-8800-eqnB6BMF2g@http.bugs.freedesktop.org/>
References: <bug-23223-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0031716889=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-23223-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0031716889==
Content-Type: multipart/alternative; boundary="1357587773.fe0Af1.3820"; charset="us-ascii"


--1357587773.fe0Af1.3820
Date: Mon, 7 Jan 2013 19:42:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=23223

--- Comment #19 from Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 72648
  --> https://bugs.freedesktop.org/attachment.cgi?id=72648&action=edit
Cat'ed dmesg logs

Yay, script bisect! I did every combination (assuming order does not  matter)
since I could not find any apparent pattern. Too bad...

I have scripts -1,0,1,2 and 3 on this card.

Combinations that work:

- -1
- -1,0
- -1,0,1
- 0
- 0,1
- 0,1,2
- 0,1,2,3
- 1
- 1,2
- 1,2,3
- 2
- 2,3
- 3

Combinations that fail:
- -1,0,1,2
- -1,0,1,2,3 (normal)

Weird thing is that the only other failing combination is the regular boot
without script 3. Do you see any patterns?

I will attach dmesg of all combo's in one file.

Please note that: minscript=2 will execute script 1,2,3. Maxscript 2 will
execute -1,0,1. So minscript=2 and maxscript=2 will execute script 1 only.

If boot is scrambled, nouveau will give fbcon messages on each lockup. If it's
not scrambled it won't, so it's directly related.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1357587773.fe0Af1.3820
Date: Mon, 7 Jan 2013 19:42:53 +0000
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
   title="NEW --- - [NV4B] nVidia Geforce 7300 fails to properly resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=23223#c19">Comment # 19</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV4B] nVidia Geforce 7300 fails to properly resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=23223">bug 23223</a>
              from <span class="vcard"><a class="email" href="mailto:ronald645&#64;gmail.com" title="Ronald &lt;ronald645&#64;gmail.com&gt;"> <span class="fn">Ronald</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=72648" name="attach_72648" title="Cat'ed dmesg logs">attachment 72648</a> <a href="attachment.cgi?id=72648&amp;action=edit" title="Cat'ed dmesg logs">[details]</a></span>
Cat'ed dmesg logs

Yay, script bisect! I did every combination (assuming order does not  matter)
since I could not find any apparent pattern. Too bad...

I have scripts -1,0,1,2 and 3 on this card.

Combinations that work:

- -1
- -1,0
- -1,0,1
- 0
- 0,1
- 0,1,2
- 0,1,2,3
- 1
- 1,2
- 1,2,3
- 2
- 2,3
- 3

Combinations that fail:
- -1,0,1,2
- -1,0,1,2,3 (normal)

Weird thing is that the only other failing combination is the regular boot
without script 3. Do you see any patterns?

I will attach dmesg of all combo's in one file.

Please note that: minscript=2 will execute script 1,2,3. Maxscript 2 will
execute -1,0,1. So minscript=2 and maxscript=2 will execute script 1 only.

If boot is scrambled, nouveau will give fbcon messages on each lockup. If it's
not scrambled it won't, so it's directly related.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1357587773.fe0Af1.3820--

--===============0031716889==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0031716889==--
