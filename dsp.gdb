
set $dsp_addr = 0

define dsp
	set $i = 0
	set $addr = $dsp_addr
	set $cnt = 1

	if ($argc > 0)
		set $addr = $arg0
	end
	if ($argc > 1)
		set $cnt = $arg1
	end

	if ($addr == 0)
		set $addr = $rsp
	end

	while ($i < $cnt)
		set $i = $i + 1
		printf "%#018llx: %#018llx | ", $addr, *(void**)$addr
		info symbol *(void**)$addr
		set $addr = $addr + 8
	end

	set $dsp_addr = $addr
end

