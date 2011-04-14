From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 34554] Nouveau seems to have corrupted my laptop
 screen's EDID info
Date: Thu, 14 Apr 2011 15:38:04 -0700 (PDT)
Message-ID: <20110414223804.9AB6B13004F@annarchy.freedesktop.org>
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

--- Comment #15 from Andy Getz <suertreus-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-04-14 15:38:04 PDT ---
I have not figured out how this happened, or whether it is nouveau-related, but
I have developed a workaround which has successfully and completely restored
two of my affected monitors (the backlight on the third died, so I am waiting
until the replacement part arrives to tinker with it).  Will the problem happen
again?  Maybe so, but the resulting breakage is now sufficiently easy for me to
repair that I'm not too worried about it.

I was able to restore my monitors by reading the EDID [0] from the EEPROM [1]
in the monitor using DDC [2] / I2C [3][4] (using SMBus [5][6] commands), fixing
the corrupt bytes (which fortunately were only in the header and were therefore
easy to fix), and writing the corrected EDID back to the monitor's EEPROM.  I
did this using a C program and the Linux I2C interfaces [7] exported by the
video driver (still nouveau in one case, radeon in the other).  My program
requires inclusion of a header from the i2c-tools package [8]; I will attach a
copy along with the source for posterity's sake.

Compile the program with -std=gnu99 and at least -O due to inlined SMBus
functions.  Invoke the program with no arguments or read the source (or strings
the binary) to see usage help.  I recommend the following use, which also
invokes parse-edid from the read-edid package [9]:

# Find the right i2c device; reading one that's not DDC will probably give
ENODEV
edid-tool /dev/i2c-0 read > edid-bad
# If you don't get warnings here about either the header or checksum being bad,
# you probably have some other problem.
edid-tool /dev/i2c-0 fix < edid-bad > edid-fixed
parse-edid < edid-fixed
# parse-edid will read several of the display related fields out of the EDID
and
# generate an Xorg.conf Monitor section; CHECK IT TO MAKE SURE IT LOOKS SANE
# BEFORE YOU FLASH IT BACK TO YOUR MONITOR.
edid-tool /dev/i2c-0 write < edid-fixed

If there's something more seriously wrong with the EDID in your monitor's
EEPROM than a bad header or checksum, you will need to either go field by field
through the EDID standard and your monitor specifications, which hopefully you
have somewhere, and generate one, or find an identical or very similar monitor
elsewhere and capture its EDID.  If you have a monitor with multiple inputs,
they likely have distinct EEPROMs; if so, and only one is corrupted, you might
well be able to capture the proper EDID from one and flash it to the other.

Please let me know if this works for you or if you suspect there are bugs in
the program.

[0] http://en.wikipedia.org/wiki/Extended_display_identification_data
[1] http://en.wikipedia.org/wiki/EEPROM
[2] http://en.wikipedia.org/wiki/Display_Data_Channel
[3] http://en.wikipedia.org/wiki/I2c
[4] linux/Documentation/i2c/i2c-protocol
[5] http://en.wikipedia.org/wiki/SMBus
[6] linux/Documentation/i2c/smbus-protocol
[7] linux/Documentation/i2c/dev-interface
[8] http://www.lm-sensors.org/wiki/I2CTools
[9] http://www.polypux.org/projects/read-edid/

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
