From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 34554] Nouveau seems to have corrupted my laptop
 screen's EDID info
Date: Thu,  2 Jun 2011 04:07:46 -0700 (PDT)
Message-ID: <20110602110747.1048A130051@annarchy.freedesktop.org>
References: <bug-34554-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-34554-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=34554

--- Comment #19 from Stuart Pook <slp6520-Q9XR2JYHwxY@public.gmane.org> 2011-06-02 04:07:46 PDT ---
> Please let me know if this works for you or if you suspect there are bugs in
> the program.

It doesn't work for me. I tried it on the broken DVI input of my monitor and
the corrected EDID data did not look right (it was total rubbish). So I tried
it on the working HDMI input of my monitor. I get

:; ./edid-tool /dev/i2c-0 read > edid-bad
           0  1  2  3   4  5  6  7   8  9  a  b   c  d  e  f   0123 4567 89ab
cdef 
00000000  80 08 08 0e  0a 61 40 00  05 25 40 00  82 08 00 00  |.... .a@. .%@.
....|
00000010  0c 08 38 01  02 00 03 3d  50 50 60 32  1e 32 2d 01  |..8. ...= PP`2
.2-.|
00000020  17 25 05 12  3c 1e 1e 00  36 39 7f 80  14 1e 00 00  |.%.. <... 69..
....|
00000030  00 00 00 00  00 00 00 00  00 00 00 00  00 00 12 f9  |.... .... ....
....|
00000040  7f 98 00 00  00 00 00 00  04 32 47 2d  55 44 49 4d  |.... .... .2G-
UDIM|
00000050  4d 00 00 00  00 00 00 00  00 00 00 00  00 09 25 23  |M... .... ....
..%#|
00000060  cc 4e 64 00  00 00 00 00  00 00 00 00  00 00 00 00  |.Nd. .... ....
....|
00000070  00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00  |.... .... ....
....|
WARN at 211: Bad header: 0x8008 080e 0a61 4000
WARN at 219: Bad checksum: 0xfe

I'm running this as a normal user having chmoded 666 /dev/i2c-0. All of the
other /dev/i2c-? give "No such device or address". I'm running a 2.6.39-1-amd64
kernel and Debian unstable. I had to install the package libi2c-dev to get the
right /usr/include/linux/i2c-dev.h. I also had to add "#include <stddef.h>" to
get ptrdiff_t.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
